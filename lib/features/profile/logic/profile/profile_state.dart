import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/profile/data/models/profile/profile_response_model.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState<T> with _$ProfileState<T> {
  const factory ProfileState.initial() = ProfileInitial;

//get engineer data
  const factory ProfileState.loadingProfileData() = LoadingProfileData;

  const factory ProfileState.successProfileData(
      ProfileResponseModel profileData) = SuccessProfileData;

  const factory ProfileState.errorProfileData({required String error}) =
      ErrorProfileData;

//update Profile
  const factory ProfileState.loadingUpdateProfile() = LoadingUpdateProfile;

  const factory ProfileState.successUpdateProfile(
      ProfileResponseModel profileData) = SuccessUpdateProfile;

  const factory ProfileState.errorUpdateProfile({required String error}) =
      ErrorUpdateProfile;
}
