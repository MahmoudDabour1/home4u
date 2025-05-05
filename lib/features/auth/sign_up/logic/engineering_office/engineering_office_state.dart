import 'package:freezed_annotation/freezed_annotation.dart';

part 'engineering_office_state.freezed.dart';

@freezed
class EngineeringOfficeState<T> with _$EngineeringOfficeState<T> {
  const factory EngineeringOfficeState.initial() = _Initial;

  ///Engineering Office Fields
  const factory EngineeringOfficeState.loadingEngineeringOfficeFields() =
      LoadingEngineeringOfficeFields;

  const factory EngineeringOfficeState.successEngineeringOfficeFields(T data) =
      SuccessEngineeringOfficeFields;

  const factory EngineeringOfficeState.errorEngineeringOfficeFields(
      {required String error}) = ErrorEngineeringOfficeFields;

  ///Engineering Office Services
  const factory EngineeringOfficeState.loadingEngineeringOfficeServices() =
      LoadingEngineeringOfficeServices;

  const factory EngineeringOfficeState.successEngineeringOfficeServices(
      T data) = SuccessEngineeringOfficeServices;

  const factory EngineeringOfficeState.errorEngineeringOfficeServices(
      {required String error}) = ErrorEngineeringOfficeServices;
}
