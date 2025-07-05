import 'package:bloc/bloc.dart';
import 'package:home4u/features/projects_filter/data/repository/ask_requests_repository.dart';
import 'package:home4u/features/projects_filter/logic/request_asks/request_asks_state.dart';

class RequestAsksCubit extends Cubit<RequestAsksState> {
  final AskRequestsRepository _requestAsksRepository;

  RequestAsksCubit(this._requestAsksRepository)
      : super(const RequestAsksState.initial());

  Future<void> getAskEngineerRequests({
    required String askId,
  }) async {
    emit(RequestAsksState.engineerRequestAsksLoading());
    final result =
        await _requestAsksRepository.getAskEngineerRequests(askId: askId);

    result.when(
      success: (data) =>
          emit(RequestAsksState.engineerRequestAsksSuccess(data)),
      failure: (error) => emit(
        RequestAsksState.engineerRequestAsksFailure(
          error: error.message.toString(),
        ),
      ),
    );
  }

  Future<void> getAskTechnicalRequests({
    required String askId,
  }) async {
    emit(RequestAsksState.technicalRequestAsksLoading());
    final result =
        await _requestAsksRepository.getAskTechnicalRequests(askId: askId);

    result.when(
      success: (data) =>
          emit(RequestAsksState.technicalRequestAsksSuccess(data)),
      failure: (error) => emit(
        RequestAsksState.technicalRequestAsksFailure(
          error: error.message.toString(),
        ),
      ),
    );
  }

  Future<void> getAskRequestDesignRequests({
    required String askId,
  }) async {
    emit(RequestAsksState.requestDesignRequestAsksLoading());
    final result =
        await _requestAsksRepository.getAskRequestDesignRequests(askId: askId);

    result.when(
      success: (data) =>
          emit(RequestAsksState.requestDesignRequestAsksSuccess(data)),
      failure: (error) => emit(
        RequestAsksState.requestDesignRequestAsksFailure(
          error: error.message.toString(),
        ),
      ),
    );
  }

  Future<void> getAskRenovateHouseRequests({
    required String askId,
  }) async {
    emit(RequestAsksState.renovateHouseRequestAsksLoading());
    final result =
        await _requestAsksRepository.getAskRenovateHouseRequests(askId: askId);

    result.when(
      success: (data) =>
          emit(RequestAsksState.renovateHouseRequestAsksSuccess(data)),
      failure: (error) => emit(
        RequestAsksState.renovateHouseRequestAsksFailure(
          error: error.message.toString(),
        ),
      ),
    );
  }

  Future<void> getAskRenovateHouseCustomPackageRequests({
    required String askId,
  }) async {
    emit(RequestAsksState.renovateHouseCustomPackageRequestAsksLoading());
    final result = await _requestAsksRepository
        .getAskRenovateHouseCustomPackageRequests(askId: askId);

    result.when(
      success: (data) => emit(
          RequestAsksState.renovateHouseCustomPackageRequestAsksSuccess(data)),
      failure: (error) => emit(
        RequestAsksState.renovateHouseCustomPackageRequestAsksFailure(
          error: error.message.toString(),
        ),
      ),
    );
  }
}
