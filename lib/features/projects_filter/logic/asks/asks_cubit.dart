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
}
