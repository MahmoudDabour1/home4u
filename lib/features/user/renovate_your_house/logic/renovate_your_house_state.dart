import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/user/renovate_your_house/data/models/renovate_your_house_fixed_packages_filter_response.dart';

import '../data/models/renovate_your_house_custom_packages_filter_response.dart';
import '../data/models/renovate_your_house_fixed_packages_model.dart';

part 'renovate_your_house_state.freezed.dart';

@freezed
class RenovateYourHouseState<T> with _$RenovateYourHouseState<T> {
  const factory RenovateYourHouseState.initial() = _Initial;

  ///RenovateYourHouseFixedPackagesState
  factory RenovateYourHouseState.renovateYourHouseFixedPackagesLoading() =
      RenovateYourHouseFixedPackagesLoading;

  factory RenovateYourHouseState.renovateYourHouseFixedPackagesLoaded(
          RenovateYourHouseFixedPackagesModel data) =
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

  ///RenovateYourHouseFixedPackagesFilter
  factory RenovateYourHouseState.renovateYourHouseFixedPackagesFilterLoading() =
      RenovateYourHouseFixedPackagesFilterLoading;

  factory RenovateYourHouseState.renovateYourHouseFixedPackagesFilterLoaded(
          RenovateYourHouseFixedPackagesFilterResponse data) =
      RenovateYourHouseFixedPackagesFilterLoaded;

  factory RenovateYourHouseState.renovateYourHouseFixedPackagesFilterError(
      {required String error}) = RenovateYourHouseFixedPackagesFilterError;

  ///RenovateYourHouseCustomPackagesFilter
  factory RenovateYourHouseState.renovateYourHouseCustomPackagesFilterLoading() =
      RenovateYourHouseCustomPackagesFilterLoading;

  factory RenovateYourHouseState.renovateYourHouseCustomPackagesFilterLoaded(
          RenovateYourHouseCustomPackagesFilterResponse data) =
      RenovateYourHouseCustomPackagesFilterLoaded;

  factory RenovateYourHouseState.renovateYourHouseCustomPackagesFilterError(
      {required String error}) = RenovateYourHouseCustomPackagesFilterError;

  ///pagination
  const factory RenovateYourHouseState.paginationLoading() = PaginationLoading;

  const factory RenovateYourHouseState.paginationFailure(
      {required String errorMessage}) = PaginationFailure;
}
