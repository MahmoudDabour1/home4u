import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/features/profile/data/models/profile/engineer_profile_response_model.dart';
import 'package:home4u/features/profile/data/models/profile/technical_worker_profile_response_model.dart';
import 'package:home4u/features/profile/data/repos/profile_repo.dart';
import 'package:home4u/features/profile/logic/profile/profile_state.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/helpers/helper_methods.dart';
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
        uploadProfileImage().then((value) {
          engineerProfileCachedData?.data?.type?.code == "ENGINEER"
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
      String jsonString = await _prepareUpdateData();
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
      String jsonString = await _prepareUpdateData();
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

  // Future<String> _prepareUpdateData() async {
  //   var engineerProfileData =
  //       await _profileLocalDataSource.getEngineerProfileData();
  //   var technicalWorkerProfileData =
  //       await _profileLocalDataSource.getTechnicalWorkerProfileData();
  //
  //   final jsonData = {
  //     "id": engineerProfileData?.data?.id ??
  //         technicalWorkerProfileData?.data?.id ??
  //         0,
  //     // Provide a default value
  //     "statusCode": engineerProfileData?.data?.statusCode ??
  //         technicalWorkerProfileData?.data?.statusCode ??
  //         1,
  //     // Provide a default value
  //     "user": {
  //       "id": engineerProfileData?.data?.user?.id ??
  //           technicalWorkerProfileData?.data?.user?.id ??
  //           0,
  //       // Provide a default value
  //       "firstName": firstNameController.text,
  //       "lastName": lastNameController.text,
  //       "email": engineerProfileData?.data?.user?.email ??
  //           technicalWorkerProfileData?.data?.user?.email ??
  //           "",
  //       // Provide a default value
  //       "phone": engineerProfileData?.data?.user?.phone ??
  //           technicalWorkerProfileData?.data?.user?.phone ??
  //           "",
  //       // Provide a default value
  //       "personalPhoto": engineerProfileData?.data?.user?.personalPhoto ??
  //           technicalWorkerProfileData?.data?.user?.personalPhoto ??
  //           "",
  //       // Provide a default value
  //       "password": engineerProfileData?.data?.user?.password ??
  //           technicalWorkerProfileData?.data?.user?.password ??
  //           "",
  //       // Provide a default value
  //       "userType": {
  //         "id": engineerProfileData?.data?.user?.userType?.id ??
  //             technicalWorkerProfileData?.data?.user?.userType?.id ??
  //             0,
  //         // Provide a default value
  //         "code": engineerProfileData?.data?.user?.userType?.code ??
  //             technicalWorkerProfileData?.data?.user?.userType?.code ??
  //             "",
  //         // Provide a default value
  //       },
  //       "governorate":
  //           technicalWorkerProfileData?.data?.user?.governorate?.toJson() ?? {},
  //       "city": technicalWorkerProfileData?.data?.user?.city?.toJson() ?? {},
  //       "enabled": true
  //     },
  //     "type": engineerProfileData?.data?.type?.toJson() ??
  //         technicalWorkerProfileData?.data?.type?.toJson() ??
  //         {},
  //     // Provide a default value
  //     "yearsOfExperience": yearsOfExperience.text.isNotEmpty
  //         ? int.parse(yearsOfExperience.text)
  //         : engineerProfileData?.data?.yearsOfExperience ??
  //             technicalWorkerProfileData?.data?.yearsOfExperience ??
  //             0,
  //     // Provide a default value
  //     "bio": bioController.text,
  //     if (technicalWorkerProfileData?.data?.user?.userType?.code ==
  //         "TECHNICAL_WORKER")
  //       "workerServs": technicalWorkerProfileData?.data?.workerServs
  //           ?.map((e) => {"id": e.id})
  //           .toList(),
  //     if (engineerProfileData?.data?.user?.userType?.code == "ENGINEER")
  //       "linkedin": linkedinController.text,
  //     if (engineerProfileData?.data?.user?.userType?.code == "ENGINEER")
  //       "behance": behanceController.text,
  //     if (engineerProfileData?.data?.user?.userType?.code == "ENGINEER")
  //       "engineerServ": engineerProfileData?.data?.engineerServ
  //           ?.map((e) => {"id": e.id})
  //           .toList(),
  //   };
  //
  //   final jsonString = json.encode(jsonData);
  //   return jsonString;
  // }

  // Future<String> _prepareUpdateData() async {
  //   var engineerProfileData =
  //       await _profileLocalDataSource.getEngineerProfileData();
  //   var technicalWorkerProfileData =
  //       await _profileLocalDataSource.getTechnicalWorkerProfileData();
  //
  //   final jsonData = {
  //     "id":
  //         engineerProfileData?.data?.id ?? technicalWorkerProfileData?.data?.id,
  //     "statusCode": engineerProfileData?.data?.statusCode ??
  //         technicalWorkerProfileData?.data?.statusCode,
  //     "user": {
  //       "id": engineerProfileData?.data?.user?.id ??
  //           technicalWorkerProfileData?.data?.user?.id,
  //       "firstName": firstNameController.text,
  //       "lastName": lastNameController.text,
  //       "email": engineerProfileData?.data?.user?.email ??
  //           technicalWorkerProfileData?.data?.user?.email,
  //       "phone": engineerProfileData?.data?.user?.phone ??
  //           technicalWorkerProfileData?.data?.user?.phone,
  //       "personalPhoto": engineerProfileData?.data?.user?.personalPhoto ??
  //           technicalWorkerProfileData?.data?.user?.personalPhoto,
  //       "password": engineerProfileData?.data?.user?.password ??
  //           technicalWorkerProfileData?.data?.user?.password,
  //       "userType": {
  //         "id": engineerProfileData?.data?.user?.userType?.id ??
  //             technicalWorkerProfileData?.data?.user?.userType?.id,
  //         "code": engineerProfileData?.data?.user?.userType?.code ??
  //             technicalWorkerProfileData?.data?.user?.userType?.code
  //       },
  //       "governorate": selectedGovernorate != null
  //           ? {"id": int.parse(selectedGovernorate ?? "")}
  //           : engineerProfileData?.data?.user?.governorate?.toJson() ??
  //               technicalWorkerProfileData?.data?.user?.governorate?.toJson(),
  //       "city": selectedCity != null
  //           ? {"id": int.parse(selectedCity ?? "")}
  //           : engineerProfileData?.data?.user?.city?.toJson() ??
  //               technicalWorkerProfileData?.data?.user?.city?.toJson(),
  //       "enabled": true
  //     },
  //     "type": engineerProfileData?.data?.type?.toJson() ??
  //         technicalWorkerProfileData?.data?.type?.toJson(),
  //     "yearsOfExperience": yearsOfExperience.text.isNotEmpty
  //         ? int.parse(yearsOfExperience.text)
  //         : engineerProfileData?.data?.yearsOfExperience ??
  //             technicalWorkerProfileData?.data?.yearsOfExperience,
  //     "bio": bioController.text,
  //     if (SharedPrefHelper.getString(SharedPrefKeys.userType) == "ENGINEER")
  //       "linkedin": linkedinController.text,
  //     if (SharedPrefHelper.getString(SharedPrefKeys.userType) == "ENGINEER")
  //       "behance": behanceController.text,
  //     if (engineerProfileData?.data?.user?.userType?.code == "ENGINEER")
  //       "engineerServ": engineerProfileData?.data?.engineerServ
  //           ?.map((e) => {"id": e.id})
  //           .toList(),
  //     if (technicalWorkerProfileData?.data?.user?.userType?.code ==
  //         "TECHNICAL_WORKER")
  //       "workerServs": technicalWorkerProfileData?.data?.workerServs
  //           ?.map((e) => {"id": e.id})
  //           .toList(),
  //   };
  //
  //   final jsonString = json.encode(jsonData);
  //   return jsonString;
  // }
  Future<String> _prepareUpdateData() async {
    var engineerProfileData =
        await _profileLocalDataSource.getEngineerProfileData();
    var technicalWorkerProfileData =
        await _profileLocalDataSource.getTechnicalWorkerProfileData();

    // Determine the user type (ENGINEER or TECHNICAL_WORKER)
    bool isEngineer =
        engineerProfileData?.data?.user?.userType?.code == "ENGINEER";

    final jsonData = {
      "id": engineerProfileData?.data?.id ??
          technicalWorkerProfileData?.data?.id ??
          0,
      "statusCode": engineerProfileData?.data?.statusCode ??
          technicalWorkerProfileData?.data?.statusCode ??
          1,
      "user": {
        "id": engineerProfileData?.data?.user?.id ??
            technicalWorkerProfileData?.data?.user?.id ??
            0,
        "firstName": firstNameController.text.isNotEmpty
            ? firstNameController.text
            : engineerProfileData?.data?.user?.firstName ??
                technicalWorkerProfileData?.data?.user?.firstName ??
                "",
        "lastName": lastNameController.text.isNotEmpty
            ? lastNameController.text
            : engineerProfileData?.data?.user?.lastName ??
                technicalWorkerProfileData?.data?.user?.lastName ??
                "",
        "email": engineerProfileData?.data?.user?.email ??
            technicalWorkerProfileData?.data?.user?.email ??
            "",
        "phone": engineerProfileData?.data?.user?.phone ??
            technicalWorkerProfileData?.data?.user?.phone ??
            "",
        "personalPhoto": engineerProfileData?.data?.user?.personalPhoto ??
            technicalWorkerProfileData?.data?.user?.personalPhoto ??
            "",
        "password": engineerProfileData?.data?.user?.password ??
            technicalWorkerProfileData?.data?.user?.password ??
            "",
        "userType": {
          "id": engineerProfileData?.data?.user?.userType?.id ??
              technicalWorkerProfileData?.data?.user?.userType?.id ??
              0,
          "code": engineerProfileData?.data?.user?.userType?.code ??
              technicalWorkerProfileData?.data?.user?.userType?.code ??
              "",
          "name": engineerProfileData?.data?.user?.userType?.name ??
              technicalWorkerProfileData?.data?.user?.userType?.name ??
              "",
        },
        "governorate": selectedGovernorate != null
            ? {"id": int.parse(selectedGovernorate!)}
            : engineerProfileData?.data?.user?.governorate?.toJson() ??
                technicalWorkerProfileData?.data?.user?.governorate?.toJson(),
        "city": selectedCity != null
            ? {"id": int.parse(selectedCity!)}
            : engineerProfileData?.data?.user?.city?.toJson() ??
                technicalWorkerProfileData?.data?.user?.city?.toJson(),
        "engineer": null,
        "technicalWorker": null,
        "engineeringOffice": null,
        "enabled": true,
        "business": null
      },
      "type": {
        "id": isEngineer
            ? engineerProfileData?.data?.type?.id
            : technicalWorkerProfileData?.data?.type?.id ?? 0,
        "code": isEngineer
            ? engineerProfileData?.data?.type?.code
            : technicalWorkerProfileData?.data?.type?.code ?? "",
        "name": isEngineer
            ? engineerProfileData?.data?.type?.name
            : technicalWorkerProfileData?.data?.type?.name ?? "",
        "nameAr": isEngineer
            ? engineerProfileData?.data?.type?.nameAr
            : technicalWorkerProfileData?.data?.type?.nameAr ?? "",
        "nameEn": isEngineer
            ? engineerProfileData?.data?.type?.nameEn
            : technicalWorkerProfileData?.data?.type?.nameEn ?? "",
      },
      "yearsOfExperience": yearsOfExperience.text.isNotEmpty
          ? int.tryParse(yearsOfExperience.text) ?? 0
          : engineerProfileData?.data?.yearsOfExperience ??
              technicalWorkerProfileData?.data?.yearsOfExperience ??
              0,
      "bio": bioController.text.isNotEmpty
          ? bioController.text
          : engineerProfileData?.data?.bio ??
              technicalWorkerProfileData?.data?.bio ??
              "",
      if (isEngineer)
        "engineerServ": engineerProfileData?.data?.engineerServ
                ?.map((e) => {"id": e.id})
                .toList() ??
            [],
      if (!isEngineer)
        "workerServs": technicalWorkerProfileData?.data?.workerServs
                ?.map((e) => {"id": e.id})
                .toList() ??
            [],
      if (isEngineer)
        "linkedin": linkedinController.text.isNotEmpty
            ? linkedinController.text
            : engineerProfileData?.data?.linkedin ?? "",
      if (isEngineer)
        "behance": behanceController.text.isNotEmpty
            ? behanceController.text
            : engineerProfileData?.data?.behance ?? "",
    };

    final jsonString = json.encode(jsonData);
    return jsonString;
  }

  Future<void> uploadProfileImage() async {
    emit(const ProfileState.loadingUploadImage());
    try {
      final formData = await _createImageFormData();
      final result = await _profileRepo.uploadProfileImage(formData);
      result.when(
        success: (uploadProfileImageResponseModel) {
          showToast(message: 'Image Uploaded Successfully');
          if (!isClosed) {
            emit(ProfileState.successUploadImage(
                uploadProfileImageResponseModel));
            engineerProfileCachedData?.data?.type?.code == "ENGINEER"
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
}
