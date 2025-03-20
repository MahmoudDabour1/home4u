import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/helpers/shared_pref_helper.dart';
import 'package:home4u/features/profile/data/models/profile/engineer_profile_response_model.dart';
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

  EngineerProfileResponseModel? engineerProfileCachedData;
  TechnicalWorkerResponseModel? technicalWorkerProfileCachedData;

  Future<void> initializeProfileData() async {
    engineerProfileCachedData =
        await _profileLocalDataSource.getEngineerProfileData();
    technicalWorkerProfileCachedData =
        await _profileLocalDataSource.getTechnicalWorkerProfileData();
  }

  List<GovernorateDataModel> governorates = [];
  List<CityDataModel> cities = [];

  File? image;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final yearsOfExperience = TextEditingController();
  final bioController = TextEditingController();
  final linkedinController = TextEditingController();
  final behanceController = TextEditingController();
  String? selectedGovernorate;
  String? selectedCity;

  void selectImage({required BuildContext context, ImageSource? source}) {
    ImagePicker.platform
        .getImageFromSource(
      source: source!,
    )
        .then((value) {
      if (value != null) {
        image = File(value.path);
        Navigator.pop(context);
        emit(ProfileState.addImage());
        uploadProfileImage().then((value) async{
          final userType =
          await SharedPrefHelper.getString(SharedPrefKeys.userType);
          userType == "ENGINEER"
              ? getEngineerProfileData()
              : getTechnicalWorkerProfileData();
        });
      }
    });
  }

  Future<void> getEngineerProfileData() async {
    emit(const ProfileState.loadingProfileData());
    final result = await _profileRepo.getEngineerByToken();
    result.when(
      success: (profileData) async {
        await _profileLocalDataSource.cacheEngineerProfileData(profileData);
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
        logger.e("Technical Worker Profile Data Cached $profileData");
        emit(ProfileState.successTechnicalWorkerProfileData(profileData));
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
            userType == "ENGINEER"
                ? getEngineerProfileData()
                : getTechnicalWorkerProfileData();
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
        // "phone": engineerProfileData?.data?.user?.phone ??
        //     technicalWorkerProfileData?.data?.user?.phone ??
        //     "",
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
      "linkedin": linkedinController.text.isNotEmpty
          ? linkedinController.text
          : engineerProfileData?.data?.linkedin ?? "",
      "behance": behanceController.text.isNotEmpty
          ? behanceController.text
          : engineerProfileData?.data?.behance ?? "",
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
        // "phone": engineerProfileData?.data?.user?.phone ??
        //     technicalWorkerProfileData?.data?.user?.phone ??
        //     "",
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
    };

    final jsonTechnicalWorkerString = json.encode(jsonTechnicalWorkerData);
    return jsonTechnicalWorkerString;
  }
}
