import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/profile/data/models/profile/get_engineer_response_model.dart';


part 'profile_state.freezed.dart';

@freezed
class ProfileState<T> with _$ProfileState<T> {
  const factory ProfileState.initial() = ProfileInitial;

//get engineer data
  const factory ProfileState.loadingProfileData() = LoadingProfileData;

  const factory ProfileState.successProfileData(GetEngineerResponseModel engineerData) = SuccessProfileData;

  const factory ProfileState.errorProfileData({required String error}) =
      ErrorProfileData;

}
