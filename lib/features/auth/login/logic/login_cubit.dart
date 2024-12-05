import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:home4u/core/helpers/helper_methods.dart';
import 'package:home4u/features/auth/login/data/repos/login_repo.dart';

import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/shared_pref_keys.dart';
import '../../../../core/networking/dio_factory.dart';
import '../data/models/login_request_body.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  TextEditingController emailOrPhoneController =
      TextEditingController(text: "mahmoud.dabour1000000@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "12345678");
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        emailOrPhone: emailOrPhoneController.text,
        password: passwordController.text,
      ),
    );
    response.when(success: (loginResponse) async {
      await showToast(message: "Login Successfully");
      emit(LoginState.success(loginResponse));
    }, failure: (error) async{
      final errorMessage = error.message ?? "An unknown error occurred";
      await  showToast(message: errorMessage, isError: true);
      emit(LoginState.error(error: errorMessage));
    });
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
