import 'package:freezed_annotation/freezed_annotation.dart';

part 'forget_password_state.freezed.dart';
@freezed
class ForgetPasswordState<T> with _$ForgetPasswordState<T> {
  const factory ForgetPasswordState.initial() = ForgetPasswordInitial;

  const factory ForgetPasswordState.loading() = ForgetPasswordLoading;

  const factory ForgetPasswordState.success(T data) = ForgetPasswordSuccess<T>;

  const factory ForgetPasswordState.error({required String error}) = ForgetPasswordError;
}
