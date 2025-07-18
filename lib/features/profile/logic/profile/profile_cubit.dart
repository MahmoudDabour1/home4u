import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/helpers/shared_pref_helper.dart';
import 'package:home4u/features/profile/data/models/profile/engineer_profile_response_model.dart';
import 'package:home4u/features/profile/data/models/profile/engineering_office_profile_response_model.dart';
import 'package:home4u/features/profile/data/models/profile/technical_worker_profile_response_model.dart';
import 'package:home4u/features/profile/data/repos/profile_repo.dart';
import 'package:home4u/features/profile/logic/profile/profile_state.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/helpers/helper_methods.dart';
import '../../../../core/helpers/shared_pref_keys.dart';
import '../../../../core/routing/router_observer.dart';
import '../../../auth/sign_up/data/models/city_model.dart';
import '../../../auth/sign_up/data/models/governorate_model.dart';
import '../../data/data_sources/profile_local_data_source.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  final ProfileLocalDataSource _profileLocalDataSource;

  ProfileCubit(this._profileRepo, this._profileLocalDataSource)
      : super(const ProfileState.initial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  EngineerProfileResponseModel? engineerProfileData;
  TechnicalWorkerResponseModel? technicalWorkerProfileData;
  EngineeringOfficeProfileResponseModel? engineeringOfficeProfileData;

  // Future<void> initializeProfileData() async {
  //   engineerProfileCachedData =
  //       await _profileLocalDataSource.getEngineerProfileData();
  //   technicalWorkerProfileCachedData =
  //       await _profileLocalDataSource.getTechnicalWorkerProfileData();
  //   engineeringOfficeProfileCachedData =
  //       await _profileLocalDataSource.getEngineeringOfficeProfileData();
  // }

  List<GovernorateDataModel> governorates = [];
  List<CityDataModel> cities = [];

  File? image;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final yearsOfExperience = TextEditingController();
  final bioController = TextEditingController();
  final linkedinController = TextEditingController();
  final behanceController = TextEditingController();
  final facebookController = TextEditingController();
  final phoneController = TextEditingController();

  final tradeNameController = TextEditingController();
  final descriptionController = TextEditingController();

  String? selectedGovernorate;
  String? selectedCity;
  String? selectEngineeringOfficeField;

  void selectImage({required BuildContext context, ImageSource? source}) {
    final nav = Navigator.of(context);
    ImagePicker().pickImage(source: source!).then((value) {
      if (value != null) {
        image = File(value.path);
        nav.pop();
        emit(ProfileState.addImage());
        uploadProfileImage();
      }
    });
  }

  Object? get currentUser {
    switch (SharedPrefHelper.getString(SharedPrefKeys.userType)) {
      case "engineering_office":
        return engineeringOfficeProfileData?.data?.user;
      case "technical_worker":
        return technicalWorkerProfileData?.data?.user;
      case "engineer":
        return engineerProfileData?.data?.user;
      default:
        return null;
    }
  }

  Future<void> getEngineerProfileData() async {
    emit(const ProfileState.loadingProfileData());
    final result = await _profileRepo.getEngineerByToken();
    result.when(
      success: (profileData) async {
        await _profileLocalDataSource.cacheEngineerProfileData(profileData);
        engineerProfileData = profileData;
        emit(ProfileState.successEngineerProfileData(profileData));
      },
      failure: (error) {
        emit(ProfileState.errorProfileData(error: error.message.toString()));
      },
    );
  }

  Future<void> getTechnicalWorkerProfileData() async {
    emit(const ProfileState.loadingProfileData());

    final result = await _profileRepo.getTechnicalWorkerByToken();
    result.when(
      success: (profileData) async {
        await _profileLocalDataSource
            .cacheTechnicalWorkerProfileData(profileData);
        technicalWorkerProfileData = profileData;
        logger.e("Technical Worker Profile Data Cached $profileData");
        emit(ProfileState.successTechnicalWorkerProfileData(profileData));
      },
      failure: (error) {
        emit(ProfileState.errorProfileData(error: error.message.toString()));
      },
    );
  }

  Future<void> getEngineeringOfficeProfileData() async {
    emit(const ProfileState.loadingProfileData());
    final result = await _profileRepo.getEngineeringOfficeByToken();
    result.when(
      success: (profileData) async {
        await _profileLocalDataSource
            .cacheEngineeringOfficeProfileData(profileData);
        engineeringOfficeProfileData = profileData;
        logger.e("Engineering Office Profile Data Cached $profileData");
        emit(ProfileState.successEngineeringOfficeProfileData(profileData));
      },
      failure: (error) {
        emit(ProfileState.errorProfileData(error: error.message.toString()));
      },
    );
  }

  Future<void> updateEngineerProfileData(BuildContext context) async {
    try {
      emit(const ProfileState.loadingUpdateProfile());
      String jsonString = await _prepareEngineerUpdateData();
      final response = await _profileRepo.updateEngineerProfile(jsonString);
      response.when(
        success: (profileData) {
          showToast(message: "Profile Updated Successfully");
          emit(ProfileState.successUpdateEngineerProfile(profileData));
          context.pop();
          getEngineerProfileData();
        },
        failure: (error) {
          showToast(message: error.message.toString(), isError: true);
          emit(
              ProfileState.errorUpdateProfile(error: error.message.toString()));
        },
      );
    } catch (e) {
      showToast(message: e.toString(), isError: true);
      emit(ProfileState.errorUpdateProfile(error: e.toString()));
    }
  }

  Future<void> updateTechnicalWorkerProfileData(BuildContext context) async {
    try {
      emit(const ProfileState.loadingUpdateProfile());
      String jsonString = await _prepareTechnicalWorkerUpdateData();
      final response =
          await _profileRepo.updateTechnicalWorkerProfile(jsonString);
      response.when(
        success: (profileData) {
          showToast(message: "Profile Updated Successfully");
          emit(ProfileState.successUpdateTechnicalWorkerProfile(profileData));
          context.pop();
          getTechnicalWorkerProfileData();
        },
        failure: (error) {
          showToast(message: error.message.toString(), isError: true);
          emit(
              ProfileState.errorUpdateProfile(error: error.message.toString()));
        },
      );
    } catch (e) {
      showToast(message: e.toString(), isError: true);
      emit(ProfileState.errorUpdateProfile(error: e.toString()));
    }
  }

  Future<void> updateEngineeringOfficeProfileData(BuildContext context) async {
    try {
      emit(const ProfileState.loadingUpdateProfile());
      String jsonString = await _prepareEngineeringOfficeUpdateData();
      final response =
          await _profileRepo.updateEngineeringOfficeProfile(jsonString);
      response.when(
        success: (profileData) {
          showToast(message: "Profile Updated Successfully");
          emit(ProfileState.successEngineeringOfficeProfileData(profileData));
          context.pop();
          getEngineeringOfficeProfileData();
        },
        failure: (error) {
          showToast(message: error.message.toString(), isError: true);
          emit(
              ProfileState.errorUpdateProfile(error: error.message.toString()));
        },
      );
    } catch (e) {
      showToast(message: e.toString(), isError: true);
      emit(ProfileState.errorUpdateProfile(error: e.toString()));
    }
  }

  Future<void> uploadProfileImage() async {
    emit(const ProfileState.loadingUploadImage());
    try {
      final formData = await _createImageFormData();
      final result = await _profileRepo.uploadProfileImage(formData);
      final userType =
          await SharedPrefHelper.getString(SharedPrefKeys.userType);
      result.when(
        success: (uploadProfileImageResponseModel) {
          showToast(message: 'Image Uploaded Successfully');
          if (!isClosed) {
            emit(ProfileState.successUploadImage(
                uploadProfileImageResponseModel));
            logger.w("User Type: $userType");
            switch (userType) {
              case "ENGINEER":
                getEngineerProfileData();
                break;
              case "TECHNICAL_WORKER":
                getTechnicalWorkerProfileData();
                break;
              case "ENGINEERING_OFFICE":
                getEngineeringOfficeProfileData();
                break;
              default:
                getEngineeringOfficeProfileData();
                break;
            }
          }
        },
        failure: (error) {
          showToast(message: error.message.toString(), isError: true);
          if (!isClosed) {
            emit(
                ProfileState.errorUploadImage(error: error.message.toString()));
          }
        },
      );
    } catch (e) {
      showToast(message: e.toString(), isError: true);
      if (!isClosed) {
        emit(ProfileState.errorUploadImage(error: e.toString()));
      }
    }
  }

  Future<FormData> _createImageFormData() async {
    final imageFile = await MultipartFile.fromFile(
      image!.path,
      filename: image!.path.split('/').last,
      contentType: MediaType('image', 'jpeg'),
    );
    return FormData.fromMap({
      'image': imageFile,
    });
  }

  Future<String> _prepareEngineerUpdateData() async {
    var engineerProfileData =
        await _profileLocalDataSource.getEngineerProfileData();
    final jsonEngineerData = {
      "id": engineerProfileData?.data?.id ?? 0,
      "statusCode": engineerProfileData?.data?.statusCode ?? 1,
      "user": {
        "id": engineerProfileData?.data?.user?.id ?? 0,
        "firstName": firstNameController.text.isNotEmpty
            ? firstNameController.text
            : engineerProfileData?.data?.user?.firstName ?? "",
        "lastName": lastNameController.text.isNotEmpty
            ? lastNameController.text
            : engineerProfileData?.data?.user?.lastName ?? "",
        "email": engineerProfileData?.data?.user?.email ?? "",
        "phone": phoneController.text.isNotEmpty
            ? phoneController.text
            : engineerProfileData?.data?.user?.phone,
        "personalPhoto": engineerProfileData?.data?.user?.personalPhoto ?? "",
        "password": engineerProfileData?.data?.user?.password ?? "",
        "userType": {
          "id": engineerProfileData?.data?.user?.userType?.id ?? 0,
          "code": engineerProfileData?.data?.user?.userType?.code ?? "",
          "name": engineerProfileData?.data?.user?.userType?.name ?? "",
        },
        "governorate": selectedGovernorate != null
            ? {"id": int.parse(selectedGovernorate!)}
            : engineerProfileData?.data?.user?.governorate?.toJson(),
        "city": selectedCity != null
            ? {"id": int.parse(selectedCity!)}
            : engineerProfileData?.data?.user?.city?.toJson(),
        "engineer": null,
        "technicalWorker": null,
        "engineeringOffice": null,
        "enabled": true,
        "business": null
      },
      "type": {
        "id": engineerProfileData?.data?.type?.id ?? 0,
        "code": engineerProfileData?.data?.type?.code ?? "",
        "name": engineerProfileData?.data?.type?.name ?? "",
        // "nameAr": engineerProfileData?.data?.type?.nameAr ?? "",
        // "nameEn": engineerProfileData?.data?.type?.nameEn ?? "",
      },
      "yearsOfExperience": yearsOfExperience.text.isNotEmpty
          ? int.tryParse(yearsOfExperience.text) ?? 0
          : engineerProfileData?.data?.yearsOfExperience ?? 0,
      "bio": bioController.text.isNotEmpty
          ? bioController.text
          : engineerProfileData?.data?.bio ?? "",
      "engineerServ": engineerProfileData?.data?.engineerServ
              ?.map((e) => {"id": e.id})
              .toList() ??
          [],
      "linkedinLink": linkedinController.text.isNotEmpty
          ? linkedinController.text
          : engineerProfileData?.data?.linkedin ?? "",
      "behanceLink": behanceController.text.isNotEmpty
          ? behanceController.text
          : engineerProfileData?.data?.behance ?? "",
      "facebookLink": facebookController.text.isNotEmpty
          ? facebookController.text
          : engineerProfileData?.data?.facebookLink ?? "",
    };

    final jsonEngineerString = json.encode(jsonEngineerData);
    return jsonEngineerString;
  }

  Future<String> _prepareTechnicalWorkerUpdateData() async {
    var technicalProfileData =
        await _profileLocalDataSource.getTechnicalWorkerProfileData();
    final jsonTechnicalWorkerData = {
      "id": technicalProfileData?.data?.id ?? 0,
      "statusCode": technicalProfileData?.data?.statusCode ?? 1,
      "user": {
        "id": technicalProfileData?.data?.user?.id ?? 0,
        "firstName": firstNameController.text.isNotEmpty
            ? firstNameController.text
            : technicalProfileData?.data?.user?.firstName ?? "",
        "lastName": lastNameController.text.isNotEmpty
            ? lastNameController.text
            : technicalProfileData?.data?.user?.lastName ?? "",
        "email": technicalProfileData?.data?.user?.email ?? "",
        "phone": phoneController.text.isNotEmpty
            ? phoneController.text
            : technicalWorkerProfileData?.data?.user?.phone,
        "personalPhoto": technicalProfileData?.data?.user?.personalPhoto ?? "",
        "password": technicalProfileData?.data?.user?.password ?? "",
        "userType": {
          "id": technicalProfileData?.data?.user?.userType?.id ?? 0,
          "code": technicalProfileData?.data?.user?.userType?.code ?? "",
          "name": technicalProfileData?.data?.user?.userType?.name ?? "",
        },
        "governorate": selectedGovernorate != null
            ? {"id": int.parse(selectedGovernorate!)}
            : technicalProfileData?.data?.user?.governorate?.toJson(),
        "city": selectedCity != null
            ? {"id": int.parse(selectedCity!)}
            : technicalProfileData?.data?.user?.city?.toJson(),
        "engineer": null,
        "technicalWorker": null,
        "engineeringOffice": null,
        "enabled": true,
        "business": null
      },
      "type": {
        "id": technicalProfileData?.data?.type?.id ?? 0,
        "code": technicalProfileData?.data?.type?.code ?? "",
        "name": technicalProfileData?.data?.type?.name ?? "",
        // "nameAr": technicalProfileData?.data?.type?.nameAr ?? "",
        // "nameEn": technicalProfileData?.data?.type?.nameEn ?? "",
      },
      "yearsOfExperience": yearsOfExperience.text.isNotEmpty
          ? int.tryParse(yearsOfExperience.text) ?? 0
          : technicalProfileData?.data?.yearsOfExperience ?? 0,
      "workerServs": technicalProfileData?.data?.workerServs
              ?.map((e) => {"id": e.id})
              .toList() ??
          [],
      "bio": bioController.text.isNotEmpty
          ? bioController.text
          : technicalProfileData?.data?.bio ?? "",
      "linkedinLink": linkedinController.text.isNotEmpty
          ? linkedinController.text
          : technicalProfileData?.data?.linkedin ?? "",
      "behanceLink": behanceController.text.isNotEmpty
          ? behanceController.text
          : technicalProfileData?.data?.behance ?? "",
      "facebookLink": facebookController.text.isNotEmpty
          ? facebookController.text
          : technicalProfileData?.data?.facebookLink ?? "",
    };

    final jsonTechnicalWorkerString = json.encode(jsonTechnicalWorkerData);
    return jsonTechnicalWorkerString;
  }

  Future<String> _prepareEngineeringOfficeUpdateData() async {
    var engineeringOfficeData =
        await _profileLocalDataSource.getEngineeringOfficeProfileData();
    final jsonEngineeringOfficeData = {
      "id": engineeringOfficeData?.data?.id ?? 0,
      "statusCode": engineeringOfficeData?.data?.statusCode ?? 1,
      "user": {
        "id": engineeringOfficeData?.data?.user?.id ?? 0,
        "firstName": firstNameController.text.isNotEmpty
            ? firstNameController.text
            : engineeringOfficeData?.data?.user?.firstName ?? "",
        "lastName": lastNameController.text.isNotEmpty
            ? lastNameController.text
            : engineeringOfficeData?.data?.user?.lastName ?? "",
        "email": engineeringOfficeData?.data?.user?.email ?? '',
        "phone": phoneController.text.isNotEmpty
            ? phoneController.text
            : engineeringOfficeData?.data?.user?.phone ?? '',
        "personalPhoto": engineeringOfficeData?.data?.user?.personalPhoto ?? "",
        "userType": {
          "id": engineeringOfficeData?.data?.user?.userType?.id ?? 0,
        },
        "governorate": selectedGovernorate != null
            ? {"id": int.parse(selectedGovernorate!)}
            : {"id": engineeringOfficeData?.data?.user?.governorate?.id ?? 0},
        "city": selectedCity != null
            ? {"id": int.parse(selectedCity!)}
            : {"id": engineeringOfficeData?.data?.user?.city?.id ?? 0},
        "engineer": null,
        "technicalWorker": null,
        "engineeringOffice": null,
        "enabled": true,
        "business": null
      },
      "tradeName": tradeNameController.text.isNotEmpty
          ? tradeNameController.text
          : engineeringOfficeData?.data?.name ?? "",
      "description": descriptionController.text.isNotEmpty
          ? descriptionController.text
          : engineeringOfficeData?.data?.description ?? "",
      "commercialRegisterPath": null,
      "taxCardPath": null,
      "personalCardPath": null,
      "engineeringOfficeField": selectEngineeringOfficeField != null
          ? {"id": int.parse(selectEngineeringOfficeField!)}
          : {
              "id": engineeringOfficeData?.data?.engineeringOfficeField?.id ?? 0
            },
      "engineeringOfficeDepartments": engineeringOfficeData
              ?.data?.engineeringOfficeDepartments
              ?.map((e) => {"id": e.id})
              .toList() ??
          [],
      "linkedinLink": linkedinController.text.isNotEmpty
          ? linkedinController.text
          : engineeringOfficeData?.data?.linkedin ?? "",
      "behanceLink": behanceController.text.isNotEmpty
          ? behanceController.text
          : engineeringOfficeData?.data?.behance ?? "",
      "facebookLink": facebookController.text.isNotEmpty
          ? facebookController.text
          : engineeringOfficeData?.data?.facebookLink ?? "",
    };

    final jsonEngineeringOfficeString = json.encode(jsonEngineeringOfficeData);
    return jsonEngineeringOfficeString;
  }
}
