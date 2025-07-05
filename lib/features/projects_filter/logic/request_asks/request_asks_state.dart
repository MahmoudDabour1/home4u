import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/ask_requests/ask_engineer_request/ask_engineer_request_response_model.dart';
import '../../data/models/ask_requests/ask_technical_request/ask_technical_request_response_model.dart';
import '../../data/models/ask_requests/renovate_house_custom_package_request/renovate_house_custom_package_request_response_model.dart';
import '../../data/models/ask_requests/renovate_house_request/renovate_house_request_response_model.dart';
import '../../data/models/ask_requests/request_design_request/request_design_request_response_model.dart';

part 'request_asks_state.freezed.dart';

@freezed
class RequestAsksState with _$RequestAsksState {
  const factory RequestAsksState.initial() = _Initial;

  ///Request Design Request Asks
  factory RequestAsksState.requestDesignRequestAsksLoading() =
      RequestDesignRequestAsksLoading;

  factory RequestAsksState.requestDesignRequestAsksSuccess(
          RequestDesignRequestResponseModel requestDesignRequestAsk) =
      RequestDesignRequestAsksSuccess;

  factory RequestAsksState.requestDesignRequestAsksFailure(
      {required String error}) = RequestDesignRequestAsksFailure;

  ///Renovate House Request Asks
  factory RequestAsksState.renovateHouseRequestAsksLoading() =
      RenovateHouseRequestAsksLoading;

  factory RequestAsksState.renovateHouseRequestAsksSuccess(
          RenovateHouseRequestResponseModel renovateHouseRequestAsk) =
      RenovateHouseRequestAsksSuccess;

  factory RequestAsksState.renovateHouseRequestAsksFailure(
      {required String error}) = RenovateHouseRequestAsksFailure;

  ///Renovate House Custom Package Request Asks
  factory RequestAsksState.renovateHouseCustomPackageRequestAsksLoading() =
      RenovateHouseCustomPackageRequestAsksLoading;

  factory RequestAsksState.renovateHouseCustomPackageRequestAsksSuccess(
          RenovateHouseCustomPackageRequestResponseModel
              renovateHouseCustomPackageRequestAsk) =
      RenovateHouseCustomPackageRequestAsksSuccess;

  factory RequestAsksState.renovateHouseCustomPackageRequestAsksFailure(
      {required String error}) = RenovateHouseCustomPackageRequestAsksFailure;

  ///Technical Request Asks
  factory RequestAsksState.technicalRequestAsksLoading() =
      TechnicalRequestAsksLoading;

  factory RequestAsksState.technicalRequestAsksSuccess(
          AskTechnicalRequestResponseModel technicalRequestAsk) =
      TechnicalRequestAsksSuccess;

  factory RequestAsksState.technicalRequestAsksFailure(
      {required String error}) = TechnicalRequestAsksFailure;

  ///Engineer Request Asks

  factory RequestAsksState.engineerRequestAsksLoading() =
      EngineerRequestAsksLoading;

  factory RequestAsksState.engineerRequestAsksSuccess(
          AskEngineerRequestResponseModel engineerRequestAsk) =
      EngineerRequestAsksSuccess;

  factory RequestAsksState.engineerRequestAsksFailure({required String error}) =
      EngineerRequestAsksFailure;
}
