import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/core/helpers/helper_methods.dart';
import 'package:home4u/features/auth/login/data/repos/login_repo.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/shared_pref_keys.dart';
import '../../../../core/networking/dio_factory.dart';
import '../../../../core/routing/router_observer.dart';
import '../data/models/login_request_body.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  TextEditingController emailOrPhoneController =
      TextEditingController(text: "mohamedmagdydev20@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "12345678");
  final formKey = GlobalKey<FormState>();

  void emitLoginStates(context) async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        emailOrPhone: emailOrPhoneController.text,
        password: passwordController.text,
      ),
    );
    response.when(
      success: (loginResponse) async {
        final token = loginResponse.data?.token;
        final userType = loginResponse.data?.user?.userType?.code;
        final  userId = loginResponse.data?.user?.id;
        await SharedPrefHelper.setData(SharedPrefKeys.userType, userType);
        await SharedPrefHelper.setData(SharedPrefKeys.userId, userId);
        final userTypeId = loginResponse.data?.user?.userType?.id;
        final userBusinessTypeId =
            loginResponse.data?.user?.business?.businessId ?? 0;

        ///Print the token && userType && userTypeId && userBusinessTypeId
        logger.e(
          "Token: $token\nUser Type: $userType\nUser Type ID: $userTypeId\nUser Business Type ID: $userBusinessTypeId",
        );

        await saveUserToken(token!);

        await Future.wait([
          saveUserType(userType!),
          saveUserTypeId(userTypeId!),
          saveUserBusinessTypeId(userBusinessTypeId.toString()),

          ///ToDo :  the problem is inside model of login response
          ///ToDo :  tell backend to fix it "Business Id" [make business id as int not string]
        ]);
        await showToast(
          message: AppLocale.loginSuccessfully.getString(context),
        );
        emit(LoginState.success(loginResponse));
      },
      failure: (error) async {
        final errorMessage = error.message ??
            AppLocale.anUnknownErrorOccurred.getString(context);
        await showToast(message: errorMessage, isError: true);
        emit(LoginState.error(error: errorMessage));
      },
    );
  }

  Future<void> saveUserType(String userType) async {
    if (userType.isEmpty) {
      throw Exception("User type is empty or invalid.");
    }
    await SharedPrefHelper.setData(SharedPrefKeys.userType, userType);
  }

  Future<void> saveUserToken(String token) async {
    if (token.isEmpty) {
      throw Exception("Token is empty or invalid.");
    }
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }

  Future<void> saveUserTypeId(int userTypeId) async {
    await SharedPrefHelper.setData(SharedPrefKeys.userTypeId, userTypeId);
  }

  Future<void> saveUserBusinessTypeId(String? userBusinessTypeId) async {
    if (userBusinessTypeId == null) {
      throw Exception("User business type ID is empty or invalid.");
    }
    await SharedPrefHelper.setData(
      SharedPrefKeys.userBusinessTypeId,
      userBusinessTypeId,
    );
  }

  Future<void> clearUserToken() async {
    await SharedPrefHelper.removeSecuredString(SharedPrefKeys.userToken);
    DioFactory.clearTokenFromHeader();
  }
}
