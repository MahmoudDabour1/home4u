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

  ///AddCustomPackageRenovateYourHouse
  factory RenovateYourHouseState.addCustomPackageRenovateYourHouseLoading() =
      AddCustomPackageRenovateYourHouseLoading;

  factory RenovateYourHouseState.addCustomPackageRenovateYourHouseLoaded(
      T data) = AddCustomPackageRenovateYourHouseLoaded;

  factory RenovateYourHouseState.addCustomPackageRenovateYourHouseError(
      {required String error}) = AddCustomPackageRenovateYourHouseError;

  ///ChooseFixedPackageRenovateYourHouse
  factory RenovateYourHouseState.chooseFixedPackageRenovateYourHouseLoading() =
      ChooseFixedPackageRenovateYourHouseLoading;

  factory RenovateYourHouseState.chooseFixedPackageRenovateYourHouseLoaded(
      T data) = ChooseFixedPackageRenovateYourHouseLoaded;

  factory RenovateYourHouseState.chooseFixedPackageRenovateYourHouseError(
      {required String error}) = ChooseFixedPackageRenovateYourHouseError;
}
