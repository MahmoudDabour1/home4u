import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/add_request/renovate_house_custom_package/renovate_house_custom_package_single_request_response_model.dart';
import '../../data/models/ask_requests/renovate_house_custom_package_request/renovate_house_custom_package_request_response_model.dart';
import '../../data/models/asks/renovate_house_custom_package_ask/renovate_house_custom_package_asks_response_model.dart';
import '../../data/models/details/renovate_house_fixed_package_details_response_model.dart';

part 'renovate_house_custom_package_services_state.freezed.dart';

@freezed
class RenovateHouseCustomPackageServicesState
    with _$RenovateHouseCustomPackageServicesState {
  const factory RenovateHouseCustomPackageServicesState.initial() = _Initial;

  /// Renovate House Custom Package Asks
  const factory RenovateHouseCustomPackageServicesState.renovateHouseCustomPackageAsksLoading() =
      RenovateHouseCustomPackageAsksLoading;

  const factory RenovateHouseCustomPackageServicesState.renovateHouseCustomPackageAsksSuccess(
      RenovateHouseCustomPackageAsksResponseModel asks) =
      RenovateHouseCustomPackageAsksSuccess;

  const factory RenovateHouseCustomPackageServicesState.renovateHouseCustomPackageAsksFailure(
      {required String error}) = RenovateHouseCustomPackageAsksFailure;

  /// Renovate House Custom Package Service Details
  const factory RenovateHouseCustomPackageServicesState.renovateHouseCustomPackageServiceDetailsLoading() =
      RenovateHouseCustomPackageServiceDetailsLoading;

  const factory RenovateHouseCustomPackageServicesState.renovateHouseCustomPackageServiceDetailsSuccess(
      RenovateHouseFixedPackageDetailsResponseModel renovateHouseCustomPackage) =
      RenovateHouseCustomPackageServiceDetailsSuccess;

  const factory RenovateHouseCustomPackageServicesState.renovateHouseCustomPackageServiceDetailsFailure(
          {required String error}) =
      RenovateHouseCustomPackageServiceDetailsFailure;

  /// Renovate House Custom Package Service Request
  const factory RenovateHouseCustomPackageServicesState.renovateHouseCustomPackageServiceRequestLoading() =
      RenovateHouseCustomPackageServiceRequestLoading;

  const factory RenovateHouseCustomPackageServicesState.renovateHouseCustomPackageServiceRequestSuccess(
          RenovateHouseCustomPackageSingleRequestResponseModel
              renovateHouseRequest) =
      RenovateHouseCustomPackageServiceRequestSuccess;

  const factory RenovateHouseCustomPackageServicesState.renovateHouseCustomPackageServiceRequestFailure(
          {required String error}) =
      RenovateHouseCustomPackageServiceRequestFailure;

  /// Renovate House Custom Package Service Requests
  const factory RenovateHouseCustomPackageServicesState.renovateHouseCustomPackageServiceRequestsLoading() =
      RenovateHouseCustomPackageServiceRequestsLoading;

  const factory RenovateHouseCustomPackageServicesState.renovateHouseCustomPackageServiceRequestsSuccess(
      RenovateHouseCustomPackageRequestResponseModel
              renovateHouseRequests) =
      RenovateHouseCustomPackageServiceRequestsSuccess;

  const factory RenovateHouseCustomPackageServicesState.renovateHouseCustomPackageServiceRequestsFailure(
          {required String error}) =
      RenovateHouseCustomPackageServiceRequestsFailure;
}