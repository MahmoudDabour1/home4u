import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_state.dart';
import 'package:logger/logger.dart';

import '../../../../core/helpers/helper_methods.dart';
import '../data/models/city_model.dart';
import '../data/models/governorate_model.dart';
import '../data/models/sign_up_body.dart';
import '../data/models/user_type_model.dart';
import '../data/repos/sign_up_repository.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepository signUpRepository;

  SignUpCubit(this.signUpRepository) : super(const SignUpState.initial());

  List<UserTypeData> userTypes = [];
  List<GovernorateDataModel> governorates = [];
  List<CityDataModel> cities = [];

  void getUserTypes() async {
    if (userTypes.isNotEmpty) {
      emit(SignUpState.successUserTypes(userTypes));
      return;
    }

    emit(const SignUpState.loadingUserTypes());
    final userTypesResponse = await signUpRepository.getUserTypes();
    userTypesResponse.when(success: (data) {
      userTypes = data;
      emit(SignUpState.successUserTypes(data));
    }, failure: (error) {
      emit(SignUpState.errorUserTypes(
          error: error.message ?? "An unknown error occurred"));
    });
  }

  void getGovernorates() async {
    emit(const SignUpState.loadingGovernorates());
    final governoratesResponse = await signUpRepository.getGovernorates();
    governoratesResponse.when(success: (data) {
      governorates = data;
      emit(SignUpState.successGovernorates(data));
    }, failure: (error) {
      emit(SignUpState.errorGovernorates(
          error: error.message ?? "An unknown error occurred"));
    });
  }

  void getCities(int governorateId) async {
    emit(const SignUpState.loadingCities());
    final citiesResponse = await signUpRepository.getCities(governorateId);
    citiesResponse.when(success: (data) {
      cities = data;
      emit(SignUpState.successCities(data));
    }, failure: (error) {
      emit(SignUpState.errorCities(
          error: error.message ?? "An unknown error occurred"));
    });
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController =
      TextEditingController(text: "Mohamed");
  final TextEditingController lastNameController =
      TextEditingController(text: "Ahmed");
  final TextEditingController emailController =
      TextEditingController(text: "attia3104@gmail.com");
  final TextEditingController phoneController =
      TextEditingController(text: "01099101469");
  final TextEditingController passwordController =
      TextEditingController(text: "12345678");
  final TextEditingController passwordConfirmationController =
      TextEditingController(text: "12345678");

  UserTypeRequest? selectedUserType;

  void emitSignUp() async {
    if (selectedUserType == null) {
      emit(SignUpState.errorSignUp(error: "Please select a user type"));
      return;
    }

    emit(const SignUpState.loadingSignUp());
    final response = await signUpRepository.signUp(SignUpBody(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      phone: phoneController.text,
      userType: selectedUserType!,
      password: passwordController.text,
    ));

    response.when(success: (data) async {
      await showToast(message: "Sign Up Successfully");
      emit(SignUpState.successSignUp(data));
    }, failure: (error) async {
      final errorMessage = error.message ?? "An unknown error occurred";
      await showToast(message: errorMessage, isError: true);
      Logger().t("Sign Up Error: $errorMessage");
      emit(SignUpState.errorSignUp(error: errorMessage));
    });
  }
}
