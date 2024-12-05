import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/helpers/shared_pref_keys.dart';
import 'package:home4u/features/auth/forget_password/data/repos/forget_password_repo.dart';

import '../../../../core/helpers/helper_methods.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordRepo _forgetPasswordRepo;

  ForgetPasswordCubit(this._forgetPasswordRepo)
      : super(const ForgetPasswordState.initial());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController =
      TextEditingController(text: "mahmoud.dabour1000000@gmail.com");
  final formKey = GlobalKey<FormState>();

  void emitForgetPasswordStates() async {
    emit(const ForgetPasswordState.loading());
    await SharedPrefHelper.setData(SharedPrefKeys.userEmailAddress, emailController.text);
    final response = await _forgetPasswordRepo.forgetPassword(
      emailController.text,
    );
    response.when(
      success: (
        forgetPasswordResponse,
      ) async {
        await showToast(message: forgetPasswordResponse.data??"Check your email ");
        emit(ForgetPasswordState.success(forgetPasswordResponse));
      },
      failure: (error) async {
        final errorMessage = error.message ?? "An unknown error occurred";
        await showToast(message: errorMessage, isError: true);
        emit(
          ForgetPasswordState.error(error: errorMessage),
        );
      },
    );
  }
}
