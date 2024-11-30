import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/auth/sign_up/data/models/user_type_model.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState<T> with _$SignUpState<T> {
  const factory SignUpState.initial() = _Initial<T>;

  const factory SignUpState.loadingUserTypes() = LoadingUserTypes<T>;

  const factory SignUpState.successUserTypes(T data) = SuccessUserTypes<T>;

  const factory SignUpState.errorUserTypes({required String error}) = ErrorUserTypes<T>;
}