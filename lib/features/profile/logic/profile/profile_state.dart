import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/profile/data/models/profile/engineer_profile_response_model.dart';
import 'package:home4u/features/profile/data/models/profile/technical_worker_profile_response_model.dart';
import 'package:home4u/features/profile/data/models/profile/upload_profile_image_response_model.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState<T> with _$ProfileState<T> {
  const factory ProfileState.initial() = ProfileInitial;

  ///get engineer && technical worker data
  const factory ProfileState.loadingProfileData() = LoadingProfileData;

  const factory ProfileState.successEngineerProfileData(
      EngineerProfileResponseModel profileData) = SuccessEngineerProfileData;

  const factory ProfileState.successTechnicalWorkerProfileData(
          TechnicalWorkerResponseModel profileData) =
      SuccessTechnicalWorkerProfileData;

  const factory ProfileState.errorProfileData({required String error}) =
      ErrorProfileData;

  ///update engineer && technical worker Profile
  const factory ProfileState.loadingUpdateProfile() = LoadingUpdateProfile;

  const factory ProfileState.successUpdateEngineerProfile(
      EngineerProfileResponseModel profileData) = SuccessUpdateEngineerProfile;

  const factory ProfileState.successUpdateTechnicalWorkerProfile(
          TechnicalWorkerResponseModel profileData) =
      SuccessUpdateTechnicalWorkerProfile;

  const factory ProfileState.errorUpdateProfile({required String error}) =
      ErrorUpdateProfile;

  ///upload image
  const factory ProfileState.loadingUploadImage() = LoadingUploadImage;

  const factory ProfileState.successUploadImage(
          UploadProfileImageResponseModel uploadProfileImageResponseModel) =
      SuccessUploadImage;

  const factory ProfileState.errorUploadImage({required String error}) =
      ErrorUploadImage;

  ///add image
  const factory ProfileState.addImage() = AddImage;
}
