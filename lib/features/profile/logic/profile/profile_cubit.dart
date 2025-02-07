import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/utils/app_constants.dart';
import 'package:home4u/features/profile/data/models/profile/profile_response_model.dart';
import 'package:home4u/features/profile/data/repos/profile_repo.dart';
import 'package:home4u/features/profile/logic/profile/profile_state.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/helpers/helper_methods.dart';
import '../../../auth/sign_up/data/models/city_model.dart';
import '../../../auth/sign_up/data/models/governorate_model.dart';
import '../../../auth/sign_up/data/models/sign_up_body.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  final Box<ProfileResponseModel> profileBox;

  ProfileCubit(this._profileRepo, this.profileBox)
      : super(const ProfileState.initial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  ProfileResponseModel? profileCachedData;

  Future<void> initializeProfileData() async {
    var profileBoxData = await Hive.openBox<ProfileResponseModel>(kProfileBox);
    var profileData = profileBoxData.get(kProfileData);
    profileCachedData = profileData;
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
          getProfileData();
        });
      }
    });
  }

  Future<void> getProfileData() async {
    emit(const ProfileState.loadingProfileData());
    // final cachedProfile = profileBox.get(kProfileData);
    // if (cachedProfile != null) {
    //   emit(ProfileState.successProfileData(cachedProfile));
    //   return;
    // }
    final response = await _profileRepo.getEngineerByToken();
    response.when(
      success: (profileData) async {
        await profileBox.put(kProfileData, profileData);
        emit(ProfileState.successProfileData(profileData));
      },
      failure: (error) {
        emit(ProfileState.errorProfileData(error: error.message.toString()));
      },
    );
  }

  Future<void> updateProfileData(BuildContext context) async {
    try {
      emit(const ProfileState.loadingUpdateProfile());
      var profileBoxData = await Hive.openBox<ProfileResponseModel>(kProfileBox);
      var profileData = profileBoxData.get(kProfileData);

      final jsonData = {
        "id": profileData?.data?.id,
        "statusCode": profileData?.data?.statusCode,
        "user": {
          "id": profileData?.data?.user?.id,
          "firstName": firstNameController.text,
          "lastName": lastNameController.text,
          "email": profileData?.data?.user?.email,
          // "phone": ProDa,
          "personalPhoto": profileData?.data?.user?.personalPhoto,
          "password": profileData?.data?.user?.password,
          "userType": {
            "id": profileData?.data?.user?.userType?.id
          },
          "governorate": selectedGovernorate != null
        ? GovernorateRequest(id: int.parse(selectedGovernorate!))
            : null,
          "city": selectedCity != null
        ? CityRequest(id: int.parse(selectedCity!))
            : null,
          "engineer": null,
          "technicalWorker": null,
          "engineeringOffice": null,
          "enabled": true
        },
        "type": profileData?.data?.type?.toJson(),
        "yearsOfExperience": profileData?.data?.yearsOfExperience,
        "engineerServ": profileData?.data?.engineerServ?.map((e) => {"id": e.id}).toList(),
        "bio": bioController.text,
        "linkedin": linkedinController.text,
        "behance": behanceController.text,
      };

      final jsonString = json.encode(jsonData);
      final response = await _profileRepo.updateProfile(jsonString);
      response.when(
        success: (profileData) {
          showToast(message: "Profile Updated Successfully");
          emit(ProfileState.successUpdateProfile(profileData));
          context.pop();
          getProfileData ();
        },
        failure: (error) {
          showToast(message: error.message.toString(), isError: true);
          emit(ProfileState.errorUpdateProfile(error: error.message.toString()));
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
      final response = await _profileRepo.uploadProfileImage(formData);
      response.when(
        success: (uploadProfileImageResponseModel) {
          showToast(message: 'Image Uploaded Successfully');
          if (!isClosed) {
            emit(ProfileState.successUploadImage(
                uploadProfileImageResponseModel));
            getProfileData();
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
