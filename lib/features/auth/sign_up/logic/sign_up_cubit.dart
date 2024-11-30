import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_state.dart';

import '../data/models/sign_up_body.dart';
import '../data/repos/sign_up_repository.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepository signUpRepository;

  SignUpCubit(this.signUpRepository) : super(const SignUpState.initial());

  void getUserTypes() async {
    emit(const SignUpState.loadingUserTypes());
    final userTypes = await signUpRepository.getUserTypes();
    userTypes.when(success: (data) {
      emit(SignUpState.successUserTypes(data));
    }, failure: (error) {
      emit(SignUpState.errorUserTypes(
          error: error.message ?? "An unknown error occurred"));
    });
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController userTypeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  void emitSignUp() async {
    emit(const SignUpState.loadingSignUp());
    final response = await signUpRepository.signUp(SignUpBody(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      phone: phoneController.text,
      userType: UserType(id: 7, code: "GENERAL_USER"),
      password: passwordController.text,
    ));

    response.when(success: (data) {
      emit(SignUpState.successSignUp(data));
    }, failure: (error) {
      emit(SignUpState.errorSignUp(
          error: error.message ?? "An unknown error occurred"));
    });
  }
}
