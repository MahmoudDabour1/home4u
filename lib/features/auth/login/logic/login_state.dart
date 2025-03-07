import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/auth/login/data/models/login_response.dart';

part 'login_state.freezed.dart';
@freezed
 class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = LoginInitial;

  const factory LoginState.loading() = LoginLoading;

  const factory LoginState.success(LoginResponse response) = LoginSuccess;

  const factory LoginState.error({required String error}) = LoginError;

}