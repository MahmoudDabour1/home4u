import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/add_request/ask_technical/ask_technical_single_request_response_model.dart';
import '../../data/models/ask_requests/ask_technical_request/ask_technical_request_response_model.dart';
import '../../data/models/asks/technical_asks_response_model.dart';
import '../../data/models/details/ask_technical_project_details_response_model.dart';

part 'ask_technical_services_state.freezed.dart';

@freezed
class AskTechnicalServicesState with _$AskTechnicalServicesState {
  const factory AskTechnicalServicesState.initial() = _Initial;

  ///Technical Asks
  factory AskTechnicalServicesState.technicalAsksLoading() =
      TechnicalAsksLoading;

  factory AskTechnicalServicesState.technicalAsksSuccess(
      TechnicalAsksResponseModel technicalAsks) = TechnicalAsksSuccess;

  factory AskTechnicalServicesState.technicalAsksFailure(
      {required String error}) = TechnicalAsksFailure;

  ///Ask Technical Service Details
  factory AskTechnicalServicesState.askTechnicalServiceDetailsLoading() =
      AskTechnicalServiceDetailsLoading;

  factory AskTechnicalServicesState.askTechnicalServiceDetailsSuccess(
          AskTechnicalProjectDetailsResponseModel askTechnical) =
      AskTechnicalServiceDetailsSuccess;

  factory AskTechnicalServicesState.askTechnicalServiceDetailsFailure(
      {required String error}) = AskTechnicalServiceDetailsFailure;

  ///Request Ask Technical
  factory AskTechnicalServicesState.requestAskTechnicalLoading() =
      RequestAskTechnicalLoading;

  factory AskTechnicalServicesState.requestAskTechnicalSuccess(
          AskTechnicalSingleRequestResponseModel askTechnical) =
      RequestAskTechnicalSuccess;

  factory AskTechnicalServicesState.requestAskTechnicalFailure(
      {required String error}) = RequestAskTechnicalFailure;

  /// Ask Technical Requests
  factory AskTechnicalServicesState.askTechnicalRequestsLoading() =
      AskTechnicalRequestsLoading;

  factory AskTechnicalServicesState.askTechnicalRequestsSuccess(
          AskTechnicalRequestResponseModel askTechnicalRequests) =
      AskTechnicalRequestsSuccess;

  factory AskTechnicalServicesState.askTechnicalRequestsFailure(
      {required String error}) = AskTechnicalRequestsFailure;
}
