import 'package:bloc/bloc.dart';
import 'package:home4u/features/projects_filter/data/repository/asks_repository.dart';

import 'asks_state.dart';

class AsksCubit extends Cubit<AsksState> {
  final AsksRepository _asksRepository;

  AsksCubit(this._asksRepository) : super(const AsksState.initial());

  Future<void> getTechnicalAsks(String askId) async {
    emit(AsksState.technicalAsksLoading());
    final result = await _asksRepository.getTechnicalAsks(askId: askId);
    result.when(
      success: (data) => emit(AsksState.technicalAsksSuccess(data)),
      failure: (error) =>
          emit(AsksState.technicalAsksFailure(error: error.message.toString())),
    );
  }

  Future<void> getEngineerAsks(String askId) async {
    emit(AsksState.engineerAsksLoading());
    final result = await _asksRepository.getEngineerAsks(askId: askId);
    result.when(
      success: (data) => emit(AsksState.engineerAsksSuccess(data)),
      failure: (error) =>
          emit(AsksState.engineerAsksFailure(error: error.message.toString())),
    );
  }

  Future<void> getRequestDesignAsks(String askId) async {
    emit(AsksState.requestDesignAsksLoading());
    final result = await _asksRepository.getRequestDesignAsks(askId: askId);
    result.when(
      success: (data) => emit(AsksState.requestDesignAsksSuccess(data)),
      failure: (error) => emit(
          AsksState.requestDesignAsksFailure(error: error.message.toString())),
    );
  }

  Future<void> getRenovateHouseCustomPackageAsks(String askId) async {
    emit(AsksState.renovateHouseCustomPackageAsksLoading());
    final result =
        await _asksRepository.getRenovateHouseCustomPackageAsks(askId: askId);
    result.when(
      success: (data) =>
          emit(AsksState.renovateHouseCustomPackageAsksSuccess(data)),
      failure: (error) => emit(AsksState.renovateHouseCustomPackageAsksFailure(
          error: error.message.toString())),
    );
  }

  Future<void> getRenovateHouseAsks(String askId) async {
    emit(AsksState.renovateHouseAsksLoading());
    final result = await _asksRepository.getRenovateHouseAsks(askId: askId);
    result.when(
      success: (data) => emit(AsksState.renovateHouseAsksSuccess(data)),
      failure: (error) => emit(
          AsksState.renovateHouseAsksFailure(error: error.message.toString())),
    );
  }
}
