import 'package:bloc/bloc.dart';

import '../../data/models/add_request/ask_technical/add_ask_technical_request_body.dart';
import '../../data/repository/ask_technical_services_repository.dart';
import 'ask_technical_services_state.dart';

class AskTechnicalServicesCubit extends Cubit<AskTechnicalServicesState> {
  final AskTechnicalServicesRepository _askTechnicalServicesRepository;

  AskTechnicalServicesCubit(this._askTechnicalServicesRepository)
      : super(const AskTechnicalServicesState.initial());

  ///Technical Asks
  Future<void> getTechnicalAsks({
    required String askId,
  }) async {
    emit(AskTechnicalServicesState.technicalAsksLoading());
    final result =
        await _askTechnicalServicesRepository.getTechnicalAsks(askId: askId);

    result.when(
      success: (data) =>
          emit(AskTechnicalServicesState.technicalAsksSuccess(data)),
      failure: (error) => emit(
        AskTechnicalServicesState.technicalAsksFailure(
          error: error.message.toString(),
        ),
      ),
    );
  }

  ///Ask Technical Service Details
  Future<void> askTechnicalServiceDetails({
    required String askId,
  }) async {
    emit(AskTechnicalServicesState.askTechnicalServiceDetailsLoading());
    final result = await _askTechnicalServicesRepository
        .askTechnicalServiceDetails(askId: askId);

    result.when(
      success: (data) => emit(
          AskTechnicalServicesState.askTechnicalServiceDetailsSuccess(data)),
      failure: (error) => emit(
        AskTechnicalServicesState.askTechnicalServiceDetailsFailure(
          error: error.message.toString(),
        ),
      ),
    );
  }

  ///Request Ask Technical
  Future<void> requestAskTechnical({
    required AddAskTechnicalRequestBody askTechnicalRequestBody,
  }) async {
    emit(AskTechnicalServicesState.requestAskTechnicalLoading());
    final result = await _askTechnicalServicesRepository.requestAskTechnical(
        askTechnicalRequestBody: askTechnicalRequestBody);

    result.when(
      success: (data) =>
          emit(AskTechnicalServicesState.requestAskTechnicalSuccess(data)),
      failure: (error) => emit(
        AskTechnicalServicesState.requestAskTechnicalFailure(
          error: error.message.toString(),
        ),
      ),
    );
  }

  /// Ask Technical Requests
  Future<void> getAskTechnicalRequests({
    required String askId,
  }) async {
    emit(AskTechnicalServicesState.askTechnicalRequestsLoading());
    final result = await _askTechnicalServicesRepository
        .getAskTechnicalRequests(askId: askId);

    result.when(
      success: (data) =>
          emit(AskTechnicalServicesState.askTechnicalRequestsSuccess(data)),
      failure: (error) => emit(
        AskTechnicalServicesState.askTechnicalRequestsFailure(
          error: error.message.toString(),
        ),
      ),
    );
  }
}
