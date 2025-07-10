import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:home4u/features/projects_filter/logic/request_design/request_design_services_state.dart';

import '../../data/models/add_request/request_design/add_request_design_request_body.dart';
import '../../data/repository/request_design_services_repository.dart';

class RequestDesignServicesCubit extends Cubit<RequestDesignServicesState> {
  final RequestDesignServicesRepository _requestDesignServicesRepository;

  RequestDesignServicesCubit(this._requestDesignServicesRepository)
      : super(const RequestDesignServicesState.initial());

  ///Controllers
  final TextEditingController commentController = TextEditingController();
  final GlobalKey<FormState> requestDesignFormKey = GlobalKey<FormState>();

  ///Request Design Service Requests
  Future<void> getAskRequestDesignRequests({
    required String askId,
  }) async {
    emit(RequestDesignServicesState.requestDesignServiceRequestsLoading());
    final result = await _requestDesignServicesRepository
        .getAskRequestDesignRequests(askId);

    result.when(
      success: (data) => emit(
          RequestDesignServicesState.requestDesignServiceRequestsSuccess(data)),
      failure: (error) => emit(
        RequestDesignServicesState.requestDesignServiceRequestsFailure(
          error: error.message.toString(),
        ),
      ),
    );
  }

  ///Request Design Service Request
  Future<void> requestAskRequestDesign({
    required AddRequestDesignRequestBody askRequestDesignRequestBody,
  }) async {
    emit(RequestDesignServicesState.requestDesignServiceRequestLoading());
    final result = await _requestDesignServicesRepository
        .requestAskRequestDesign(askRequestDesignRequestBody);

    result.when(
      success: (data) => emit(
          RequestDesignServicesState.requestDesignServiceRequestSuccess(data)),
      failure: (error) => emit(
        RequestDesignServicesState.requestDesignServiceRequestFailure(
          error: error.message.toString(),
        ),
      ),
    );
  }

  ///Request Design Service Details
  Future<void> requestDesignDetails({
    required String requestId,
  }) async {
    emit(RequestDesignServicesState.requestDesignServiceDetailsLoading());
    final result =
        await _requestDesignServicesRepository.requestDesignDetails(requestId);

    result.when(
      success: (data) => emit(
          RequestDesignServicesState.requestDesignServiceDetailsSuccess(data)),
      failure: (error) => emit(
        RequestDesignServicesState.requestDesignServiceDetailsFailure(
          error: error.message.toString(),
        ),
      ),
    );
  }

  ///Request Design Asks
  Future<void> getRequestDesignAsks({
    required String askId,
  }) async {
    emit(RequestDesignServicesState.requestDesignAsksLoading());
    final result =
        await _requestDesignServicesRepository.getRequestDesignAsks(askId);

    result.when(
      success: (data) =>
          emit(RequestDesignServicesState.requestDesignAsksSuccess(data)),
      failure: (error) => emit(
        RequestDesignServicesState.requestDesignAsksFailure(
          error: error.message.toString(),
        ),
      ),
    );
  }
}
