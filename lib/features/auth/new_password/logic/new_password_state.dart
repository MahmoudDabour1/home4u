
import 'package:freezed_annotation/freezed_annotation.dart';
part 'new_password_state.freezed.dart';
@freezed
 class NewPasswordState<T> with _$NewPasswordState<T> {
  const factory NewPasswordState.initial() = NewPasswordInitial;

  const factory NewPasswordState.loading() = NewPasswordLoading;

  const factory NewPasswordState.success(T data) = NewPasswordSuccess<T>;

  const factory NewPasswordState.error(
      {required String error}) = NewPasswordError;
}
