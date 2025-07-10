import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/add_request/request_design/request_design_single_request_response_model.dart';
import '../../data/models/ask_requests/request_design_request/request_design_request_response_model.dart';
import '../../data/models/asks/request_design_ask/request_design_asks_response_model.dart';
import '../../data/models/details/request_design_project_details_response_model.dart';

part 'request_design_services_state.freezed.dart';

@freezed
class RequestDesignServicesState with _$RequestDesignServicesState {
  const factory RequestDesignServicesState.initial() = _Initial;

  ///Request Design Asks
  const factory RequestDesignServicesState.requestDesignAsksLoading() =
      RequestDesignAsksLoading;

  const factory RequestDesignServicesState.requestDesignAsksSuccess(
      RequestDesignAsksResponseModel asks) = RequestDesignAsksSuccess;

  const factory RequestDesignServicesState.requestDesignAsksFailure(
      {required String error}) = RequestDesignAsksFailure;

  ///Request Design Service Details
  const factory RequestDesignServicesState.requestDesignServiceDetailsLoading() =
      RequestDesignServiceDetailsLoading;

  const factory RequestDesignServicesState.requestDesignServiceDetailsSuccess(
          RequestDesignProjectDetailsResponseModel requestDesign) =
      RequestDesignServiceDetailsSuccess;

  const factory RequestDesignServicesState.requestDesignServiceDetailsFailure(
      {required String error}) = RequestDesignServiceDetailsFailure;

  ///Request Design Service Request
  const factory RequestDesignServicesState.requestDesignServiceRequestLoading() =
      RequestDesignServiceRequestLoading;

  const factory RequestDesignServicesState.requestDesignServiceRequestSuccess(
          RequestDesignSingleRequestResponseModel requestDesignRequest) =
      RequestDesignServiceRequestSuccess;

  const factory RequestDesignServicesState.requestDesignServiceRequestFailure(
      {required String error}) = RequestDesignServiceRequestFailure;

  ///Request Design Service Requests
  const factory RequestDesignServicesState.requestDesignServiceRequestsLoading() =
      RequestDesignServiceRequestsLoading;

  const factory RequestDesignServicesState.requestDesignServiceRequestsSuccess(
          RequestDesignRequestResponseModel requestDesignRequests) =
      RequestDesignServiceRequestsSuccess;

  const factory RequestDesignServicesState.requestDesignServiceRequestsFailure(
      {required String error}) = RequestDesignServiceRequestsFailure;
}
