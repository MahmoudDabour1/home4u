import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_state.dart';
import 'package:logger/logger.dart';

import '../../../../core/helpers/helper_methods.dart';
import '../data/models/city_model.dart';
import '../data/models/engineer_body.dart';
import '../data/models/governorate_model.dart';
import '../data/models/sign_up_body.dart';
import '../data/models/user_type_model.dart';
import '../data/models/worker_body.dart';
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
  final TextEditingController yearsOfExperienceController =
      TextEditingController(text: "5");

  UserTypeRequest? selectedUserType;
  EngineerRequest? engineerRequest;
  TechnicalWorkerRequest? technicalWorkerRequest;
  String? selectedGovernorate;
  String? selectedCity;
  int? selectedEngineerType;
  List<int>? selectedEngineerServices;
  String? selectedWorkerType;
  List<String>? selectedWorkerServices;

  void emitSignUp() async {
    if (selectedUserType == null) {
      emit(SignUpState.errorSignUp(error: "Please select a user type"));
      return;
    }

    emit(const SignUpState.loadingSignUp());

    if (selectedUserType!.code == "ENGINEER") {
      if (selectedEngineerType == null || selectedEngineerServices == null) {
        emit(
            SignUpState.errorSignUp(error: "Please complete engineer details"));
        return;
      }
      engineerRequest = EngineerRequest(
        type: EngineerTypeRequest(id: selectedEngineerType!),
        yearsOfExperience: int.parse(yearsOfExperienceController.text),
        engineerServ: selectedEngineerServices!
            .map((id) => EngineerServiceRequest(id: id))
            .toList(),
      );
    } else if (selectedUserType!.code == "TECHNICAL_WORKER") {
      if (selectedWorkerType == null || selectedWorkerServices == null) {
        emit(SignUpState.errorSignUp(error: "Please complete worker details"));
        return;
      }
      technicalWorkerRequest = TechnicalWorkerRequest(
        type: WorkerTypeRequest(id: int.parse(selectedWorkerType!)),
        yearsOfExperience: int.parse(yearsOfExperienceController.text),
        workerServs: selectedWorkerServices!
            .map((id) => WorkerServiceRequest(id: int.parse(id)))
            .toList(),
      );
    }

    final response = await signUpRepository.signUp(SignUpBody(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
      governorate: selectedGovernorate != null
          ? GovernorateRequest(id: int.parse(selectedGovernorate!))
          : null,
      city: selectedCity != null
          ? CityRequest(id: int.parse(selectedCity!))
          : null,
      userType: selectedUserType!,
      engineer: engineerRequest,
      technicalWorker: technicalWorkerRequest,
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
