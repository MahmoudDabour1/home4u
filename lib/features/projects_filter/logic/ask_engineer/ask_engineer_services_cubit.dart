import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:home4u/features/projects_filter/data/repository/ask_engineer_services_repository.dart';

import '../../data/models/add_request/ask_engineer/add_ask_engineer_request_body.dart';
import 'ask_engineer_services_state.dart';

class AskEngineerServicesCubit extends Cubit<AskEngineerServicesState> {
  final AskEngineerServicesRepository _askEngineerServicesRepository;

  AskEngineerServicesCubit(this._askEngineerServicesRepository)
      : super(const AskEngineerServicesState.initial());

  ///Controller
  final TextEditingController commentController = TextEditingController();
  final GlobalKey<FormState> askEngineerFormKey = GlobalKey<FormState>();

  ///Engineer Asks
  Future<void> getAskEngineerMyAsks({
    required String askId,
  }) async {
    emit(AskEngineerServicesState.engineerAsksLoading());
    final result = await _askEngineerServicesRepository.getEngineerAsks(askId);

    result.when(
      success: (data) =>
          emit(AskEngineerServicesState.engineerAsksSuccess(data)),
      failure: (error) => emit(
        AskEngineerServicesState.engineerAsksFailure(
          error: error.message.toString(),
        ),
      ),
    );
  }

  ///Ask Engineer Service Details
  Future<void> askEngineerServiceDetails({
    required String askId,
  }) async {
    emit(AskEngineerServicesState.askEngineerServiceDetailsLoading());
    final result =
        await _askEngineerServicesRepository.askEngineerServiceDetails(askId);

    result.when(
      success: (data) =>
          emit(AskEngineerServicesState.askEngineerServiceDetailsSuccess(data)),
      failure: (error) => emit(
        AskEngineerServicesState.askEngineerServiceDetailsFailure(
          error: error.message.toString(),
        ),
      ),
    );
  }

  ///Request Ask Engineer
  Future<void> requestAskEngineer({
    required AddAskEngineerRequestBody askEngineerRequestBody,
  }) async {
    emit(AskEngineerServicesState.requestAskEngineerLoading());
    final result = await _askEngineerServicesRepository
        .requestAskEngineer(askEngineerRequestBody);

    result.when(
      success: (data) =>
          emit(AskEngineerServicesState.requestAskEngineerSuccess(data)),
      failure: (error) => emit(
        AskEngineerServicesState.requestAskEngineerFailure(
          error: error.message.toString(),
        ),
      ),
    );
  }

  /// Ask Engineer Requests

  Future<void> getAskEngineerRequests({
    required String askId,
  }) async {
    emit(AskEngineerServicesState.askEngineerRequestsLoading());
    final result =
        await _askEngineerServicesRepository.getAskEngineerRequests(askId);

    result.when(
      success: (data) =>
          emit(AskEngineerServicesState.askEngineerRequestsSuccess(data)),
      failure: (error) => emit(
        AskEngineerServicesState.askEngineerRequestsFailure(
          error: error.message.toString(),
        ),
      ),
    );
  }
}
