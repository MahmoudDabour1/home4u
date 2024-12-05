import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState<T> with _$SignUpState<T> {
  const factory SignUpState.initial() = _Initial<T>;

  const factory SignUpState.loadingUserTypes() = LoadingUserTypes<T>;

  const factory SignUpState.successUserTypes(T data) = SuccessUserTypes<T>;

  const factory SignUpState.errorUserTypes({required String error}) =
      ErrorUserTypes<T>;

  const factory SignUpState.loadingSignUp() = SignUpLoadingState;

  const factory SignUpState.successSignUp(T data) = SignUpSuccessState<T>;

  const factory SignUpState.errorSignUp({required String error}) =
      SignUpErrorState;
}
