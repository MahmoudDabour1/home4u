import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/projects_filter/data/models/asks/technical_asks_response_model.dart';

part 'asks_state.freezed.dart';

@freezed
class AsksState with _$AsksState {
  const factory AsksState.initial() = _Initial;

  ///Technical Asks
  factory AsksState.technicalAsksLoading() = TechnicalAsksLoading;

  factory AsksState.technicalAsksSuccess(
      TechnicalAsksResponseModel technicalAsk) = TechnicalAsksSuccess;

  factory AsksState.technicalAsksFailure({required String error}) =
      TechnicalAsksFailure;
}
