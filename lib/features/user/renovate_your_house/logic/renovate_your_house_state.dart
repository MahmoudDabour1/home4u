import 'package:freezed_annotation/freezed_annotation.dart';

part 'renovate_your_house_state.freezed.dart';

@freezed
class RenovateYourHouseState<T> with _$RenovateYourHouseState<T> {
  const factory RenovateYourHouseState.initial() = _Initial;

  ///RenovateYourHouseFixedPackagesState
  factory RenovateYourHouseState.renovateYourHouseFixedPackagesLoading() =
      RenovateYourHouseFixedPackagesLoading;

  factory RenovateYourHouseState.renovateYourHouseFixedPackagesLoaded(T data) =
      RenovateYourHouseFixedPackagesLoaded;

  factory RenovateYourHouseState.renovateYourHouseFixedPackagesError(
      {required String error}) = RenovateYourHouseFixedPackagesError;

  ///RenovateYourHouseLookUpsState
  factory RenovateYourHouseState.renovateYourHouseLookUpsLoading() =
      RenovateYourHouseLookUpsLoading;

  factory RenovateYourHouseState.renovateYourHouseLookUpsLoaded(T data) =
      RenovateYourHouseLookUpsLoaded;

  factory RenovateYourHouseState.renovateYourHouseLookUpsError(
      {required String error}) = RenovateYourHouseLookUpsError;
}
