import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState<T> with _$SignUpState<T> {
  const factory SignUpState.initial() = _Initial<T>;

  const factory SignUpState.loadingUserTypes() = LoadingUserTypes<T>;

  const factory SignUpState.successUserTypes(T data) = SuccessUserTypes<T>;

  const factory SignUpState.errorUserTypes({required String error}) =
      ErrorUserTypes<T>;

  const factory SignUpState.loadingSignUp() = SignUpLoadingState;

  const factory SignUpState.successSignUp(T data) = SignUpSuccessState<T>;

  const factory SignUpState.errorSignUp({required String error}) =
      SignUpErrorState;

  /// Governorates
  const factory SignUpState.loadingGovernorates() = LoadingGovernorates;

  const factory SignUpState.successGovernorates(T data) =
      SuccessGovernorates<T>;

  const factory SignUpState.errorGovernorates({required String error}) =
      ErrorGovernorates;

  /// Cities
  const factory SignUpState.loadingCities() = LoadingCities;

  const factory SignUpState.successCities(T data) = SuccessCities<T>;

  const factory SignUpState.errorCities({required String error}) = ErrorCities;

  ///BusinessType
  const factory SignUpState.loadingBusinessType() = LoadingBusinessType;

  const factory SignUpState.successBusinessType(T data) =
      SuccessBusinessType<T>;

  const factory SignUpState.errorBusinessType({required String error}) =
      ErrorBusinessType;

  ///Engineering Office Upload  Images
  const factory SignUpState.loadingEngineeringOfficeUploadImages() =
      LoadingEngineeringOfficeUploadImages;

  const factory SignUpState.successEngineeringOfficeUploadImages() =
      SuccessEngineeringOfficeUploadImages;

  const factory SignUpState.errorEngineeringOfficeUploadImages(
      {required String error}) = ErrorEngineeringOfficeUploadImages;
}
