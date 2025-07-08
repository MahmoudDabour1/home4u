import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/add_request/ask_engineer/ask_engineer_single_request_response_model.dart';
import '../../data/models/ask_filter/engineer/ask_engineer_filter_response_model.dart';
import '../../data/models/ask_requests/ask_engineer_request/ask_engineer_request_response_model.dart';
import '../../data/models/asks/engineer_ask/engineer_asks_response_model.dart';
import '../../data/models/details/ask_engineer_project_details_response_model.dart';

part 'ask_engineer_services_state.freezed.dart';

@freezed
class AskEngineerServicesState with _$AskEngineerServicesState {
  const factory AskEngineerServicesState.initial() = _Initial;

  ///Ask Engineer Filter
  const factory AskEngineerServicesState.askEngineerFilterLoading() =
      AskEngineerFilterLoading;

  const factory AskEngineerServicesState.askEngineerFilterSuccess(
          AskEngineerFilterResponseModel askEngineerFilterResponse) =
      AskEngineerFilterSuccess;

  const factory AskEngineerServicesState.askEngineerFilterFailure(
      {required String error}) = AskEngineerFilterFailure;

  ///Request Ask Engineer
  factory AskEngineerServicesState.requestAskEngineerLoading() =
      RequestAskEngineerLoading;

  factory AskEngineerServicesState.requestAskEngineerSuccess(
          AskEngineerSingleRequestResponseModel askEngineer) =
      RequestAskEngineerSuccess;

  factory AskEngineerServicesState.requestAskEngineerFailure(
      {required String error}) = RequestAskEngineerFailure;

  ///Ask Engineer Service Details
  factory AskEngineerServicesState.askEngineerServiceDetailsLoading() =
      AskEngineerServiceDetailsLoading;

  factory AskEngineerServicesState.askEngineerServiceDetailsSuccess(
          AskEngineerProjectDetailsResponseModel askEngineer) =
      AskEngineerServiceDetailsSuccess;

  factory AskEngineerServicesState.askEngineerServiceDetailsFailure(
      {required String error}) = AskEngineerServiceDetailsFailure;

  ///Engineer Asks
  factory AskEngineerServicesState.engineerAsksLoading() = EngineerAsksLoading;

  factory AskEngineerServicesState.engineerAsksSuccess(
      EngineerAsksResponseModel engineerAsks) = EngineerAsksSuccess;

  factory AskEngineerServicesState.engineerAsksFailure(
      {required String error}) = EngineerAsksFailure;

  /// Ask Engineer Requests
  factory AskEngineerServicesState.askEngineerRequestsLoading() =
      AskEngineerRequestsLoading;

  factory AskEngineerServicesState.askEngineerRequestsSuccess(
          AskEngineerRequestResponseModel askEngineerRequests) =
      AskEngineerRequestsSuccess;

  factory AskEngineerServicesState.askEngineerRequestsFailure(
      {required String error}) = AskEngineerRequestsFailure;
}
