import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:home4u/features/auth/sign_up/data/models/business_body.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_state.dart';
import 'package:logger/logger.dart';

import '../../../../core/helpers/helper_methods.dart';
import '../data/models/business_type.dart';
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
  List<BaseData> businessTypes = [];

  Future<void> getUserTypes() async {
    if (userTypes.isNotEmpty) {
      emit(SignUpState.successUserTypes(userTypes));
      return;
    }
    emit(const SignUpState.loadingUserTypes());
    final response = await signUpRepository.getUserTypes();
    response.when(
      success: (data) => emit(SignUpState.successUserTypes(userTypes = data)),
      failure: (error) => emit(SignUpState.errorUserTypes(
          error: error.message ?? "An unknown error occurred")),
    );
  }

  Future<void> getGovernorates() async {
    emit(const SignUpState.loadingGovernorates());
    final response = await signUpRepository.getGovernorates();
    response.when(
      success: (data) =>
          emit(SignUpState.successGovernorates(governorates = data)),
      failure: (error) => emit(SignUpState.errorGovernorates(
          error: error.message ?? "An unknown error occurred")),
    );
  }

  Future<void> getCities(int governorateId) async {
    emit(const SignUpState.loadingCities());
    final response = await signUpRepository.getCities(governorateId);
    response.when(
      success: (data) => emit(SignUpState.successCities(cities = data)),
      failure: (error) => emit(SignUpState.errorCities(
          error: error.message ?? "An unknown error occurred")),
    );
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final TextEditingController yearsOfExperienceController =
      TextEditingController();
  final TextEditingController tradNameController = TextEditingController();
  final TextEditingController bioArController = TextEditingController();
  final TextEditingController bioEnController = TextEditingController();

  UserTypeRequest? selectedUserType;
  EngineerRequest? engineerRequest;
  TechnicalWorkerRequest? technicalWorkerRequest;
  BusinessBody? businessTypeRequest;
  String? selectedGovernorate;
  String? selectedCity;
  int? selectedEngineerType;
  List<int>? selectedEngineerServices;
  int? selectedWorkerType;
  List<int>? selectedWorkerServices;
  List<int>? selectedBusinessTypes;

  Future<void> getBusinessTypes(int userTypeId) async {
    emit(const SignUpState.loadingBusinessType());
    final response = await signUpRepository.getBusinessTypes(userTypeId);
    response.when(
      success: (data) =>
          emit(SignUpState.successBusinessType(businessTypes = data)),
      failure: (error) => emit(SignUpState.errorBusinessType(
          error: error.message ?? "An unknown error occurred")),
    );
  }

  Future<void> emitSignUp() async {
    if (selectedUserType == null) {
      emit(SignUpState.errorSignUp(error: "Please select a user type"));
      return;
    }
    emit(const SignUpState.loadingSignUp());
    _prepareSignUpData();
    final response = await signUpRepository.signUp(_buildSignUpBody());
    response.when(
      success: (data) async {
        await showToast(message: "Sign Up Successfully");
        emit(SignUpState.successSignUp(data));
      },
      failure: (error) async {
        final errorMessage = error.message ?? "An unknown error occurred";
        await showToast(message: errorMessage, isError: true);
        Logger().t("Sign Up Error: $errorMessage");
        emit(SignUpState.errorSignUp(error: errorMessage));
      },
    );
  }

  void _prepareSignUpData() {
    switch (selectedUserType!.code) {
      case "ENGINEER":
        if (selectedEngineerType == null || selectedEngineerServices == null) {
          emit(SignUpState.errorSignUp(
              error: "Please complete engineer details"));
          return;
        }
        engineerRequest = EngineerRequest(
          type: EngineerTypeRequest(id: selectedEngineerType!),
          yearsOfExperience: int.parse(yearsOfExperienceController.text),
          engineerServ: selectedEngineerServices!
              .map((id) => EngineerServiceRequest(id: id))
              .toList(),
        );
        break;
      case "TECHNICAL_WORKER":
        if (selectedWorkerType == null || selectedWorkerServices == null) {
          emit(
              SignUpState.errorSignUp(error: "Please complete worker details"));
          return;
        }
        technicalWorkerRequest = TechnicalWorkerRequest(
          type: WorkerTypeRequest(id: selectedWorkerType ?? 1),
          yearsOfExperience: int.parse(yearsOfExperienceController.text),
          workerServs: selectedWorkerServices!
              .map((id) => WorkerServiceRequest(id: id))
              .toList(),
        );
        break;
      case "EXHIBITION":
      case "STORE":
        if (selectedBusinessTypes == null) {
          emit(SignUpState.errorSignUp(
              error: "Please complete business details"));
          return;
        }
        businessTypeRequest = BusinessBody(
          bioAr: bioArController.text,
          bioEn: bioEnController.text,
          tradName: tradNameController.text,
          businessTypes: selectedBusinessTypes!
              .map((id) => BusinessTypeIds(id: id))
              .toList(),
        );
        break;
    }
  }

  SignUpBody _buildSignUpBody() => SignUpBody(
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
        business: businessTypeRequest,
      );
}
