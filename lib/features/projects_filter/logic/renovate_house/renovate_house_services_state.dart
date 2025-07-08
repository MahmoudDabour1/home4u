import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/add_request/renovate_house/renovate_house_single_request_response_model.dart';
import '../../data/models/ask_requests/renovate_house_request/renovate_house_request_response_model.dart';
import '../../data/models/asks/renovate_house_ask/renovate_house_asks_response_model.dart';
import '../../data/models/details/renovate_house_details_response_model.dart';

part 'renovate_house_services_state.freezed.dart';

@freezed
class RenovateHouseServicesState with _$RenovateHouseServicesState {
  const factory RenovateHouseServicesState.initial() = _Initial;

  /// Renovate House Asks
  const factory RenovateHouseServicesState.renovateHouseAsksLoading() =
      RenovateHouseAsksLoading;

  const factory RenovateHouseServicesState.renovateHouseAsksSuccess(
      RenovateHouseAsksResponseModel asks) = RenovateHouseAsksSuccess;

  const factory RenovateHouseServicesState.renovateHouseAsksFailure(
      {required String error}) = RenovateHouseAsksFailure;

  /// Renovate House Service Details
  const factory RenovateHouseServicesState.renovateHouseServiceDetailsLoading() =
      RenovateHouseServiceDetailsLoading;

  const factory RenovateHouseServicesState.renovateHouseServiceDetailsSuccess(
          RenovateHouseDetailsResponseModel renovateHouse) =
      RenovateHouseServiceDetailsSuccess;

  const factory RenovateHouseServicesState.renovateHouseServiceDetailsFailure(
      {required String error}) = RenovateHouseServiceDetailsFailure;

  /// Renovate House Service Request
  const factory RenovateHouseServicesState.renovateHouseServiceRequestLoading() =
      RenovateHouseServiceRequestLoading;

  const factory RenovateHouseServicesState.renovateHouseServiceRequestSuccess(
          RenovateHouseSingleRequestResponseModel renovateHouseRequest) =
      RenovateHouseServiceRequestSuccess;

  const factory RenovateHouseServicesState.renovateHouseServiceRequestFailure(
      {required String error}) = RenovateHouseServiceRequestFailure;

  /// Renovate House Service Requests
  const factory RenovateHouseServicesState.renovateHouseServiceRequestsLoading() =
      RenovateHouseServiceRequestsLoading;

  const factory RenovateHouseServicesState.renovateHouseServiceRequestsSuccess(
          RenovateHouseRequestResponseModel renovateHouseRequests) =
      RenovateHouseServiceRequestsSuccess;

  const factory RenovateHouseServicesState.renovateHouseServiceRequestsFailure(
      {required String error}) = RenovateHouseServiceRequestsFailure;
}
