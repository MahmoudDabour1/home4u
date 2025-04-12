import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:home4u/core/helpers/shared_pref_keys.dart';
import 'package:home4u/features/auth/sign_up/data/models/business_body.dart';
import 'package:home4u/features/auth/sign_up/data/models/engineering_office_body.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_state.dart';
import 'package:logger/logger.dart';

import '../../../../core/helpers/helper_methods.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
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

  ///base
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  ///engineer && technical worker
  final TextEditingController yearsOfExperienceController =
      TextEditingController();

  ///engineering office && business
  final TextEditingController tradNameController = TextEditingController();
  final TextEditingController bioArController = TextEditingController();
  final TextEditingController bioEnController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  File? commercialRegisterImage;
  File? taxCardImage;
  File? personalCardImage;

  UserTypeRequest? selectedUserType;
  EngineerRequest? engineerRequest;
  TechnicalWorkerRequest? technicalWorkerRequest;
  BusinessBody? businessTypeRequest;
  EngineeringOfficeBody? engineeringOfficeRequest;
  String? selectedGovernorate;
  String? selectedCity;
  int? selectedEngineerType;
  List<int>? selectedEngineerServices;
  int? selectedWorkerType;
  List<int>? selectedWorkerServices;
  List<int>? selectedBusinessTypes;
  int? selectedEngineeringOfficeField;
  List<int>? selectedEngineeringOfficeDepartments;

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
    await SharedPrefHelper.setData(
        SharedPrefKeys.userEmailAddress, emailController.text);
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
      case "ENGINEERING_OFFICE":
        if (selectedEngineeringOfficeField == null ||
            selectedEngineeringOfficeDepartments == null) {
          emit(SignUpState.errorSignUp(
              error: "Please complete engineering office details"));
          return;
        }
        ///need to check here first that all images have been uploaded successfully
        engineeringOfficeRequest = EngineeringOfficeBody(
          tradeName: tradNameController.text,
          description: descriptionController.text,
          engineeringOfficeField: selectedEngineeringOfficeField != null
              ? EngineeringOfficeId(id: selectedEngineeringOfficeField!)
              : null,
          engineeringOfficeDepartments: selectedEngineeringOfficeDepartments!
              .map((id) => EngineeringOfficeId(id: id))
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
        engineeringOffice: engineeringOfficeRequest,
      );

  void _uploadEngineeringOfficeImages(int imageId){

  }
}

//
// ///Step :: 3
// Future<void> _uploadBusinessImages(
//     BusinessAddProductImagesResponse imageResponse) async {
//   emit(const BusinessAddProductState.uploadBusinessImageLoading());
//   DioFactory.setContentTypeForMultipart();
//
//   final imageFiles = await Future.wait(
//     images.map(
//           (image) => MultipartFile.fromFile(
//         image.path,
//         filename: image.path.split('/').last,
//         contentType: MediaType('image', 'jpeg'),
//       ),
//     ),
//   );
//
//   int successCount = 0;
//
//   for (var i = 0; i < imageFiles.length; i++) {
//     final result = await _repository.uploadBusinessImage("BUSINESS_PRODUCTS",
//         imageResponse.data[i].id, FormData.fromMap({'file': imageFiles[i]}));
//
//     result.when(
//       success: (uploadResponse) {
//         if (uploadResponse.success) {
//           successCount++;
//           if (successCount == imageFiles.length) {
//             DioFactory.setContentType('application/json');
//             emit(const BusinessAddProductState.uploadBusinessImageSuccess());
//           }
//         } else {
//           emit(
//             BusinessAddProductState.uploadBusinessImageFailure(
//               uploadResponse.data.toString(),
//             ),
//           );
//         }
//       },
//       failure: (error) => emit(
//         BusinessAddProductState.uploadBusinessImageFailure(
//           error.message.toString(),
//         ),
//       ),
//     );
//   }
// }