
import 'package:freezed_annotation/freezed_annotation.dart';
part 'engineer_state.freezed.dart';

@freezed
class EngineerState<T> with _$EngineerState<T> {
  const factory EngineerState.initial() = _Initial;

  ///Engineer Types
  const factory EngineerState.loadingEngineerTypes() = LoadingEngineerTypes;

  const factory EngineerState.successEngineerTypes(T data) =
      SuccessEngineerTypes<T>;

  const factory EngineerState.errorEngineerTypes({required String error}) =
      ErrorEngineerTypes;

  ///Engineer Services
  const factory EngineerState.loadingEngineerServices() =
      LoadingEngineerServices;

  const factory EngineerState.successEngineerServices(T data) =
      SuccessEngineerServices<T>;

  const factory EngineerState.errorEngineerServices({required String error}) =
      ErrorEngineerServices;
}
