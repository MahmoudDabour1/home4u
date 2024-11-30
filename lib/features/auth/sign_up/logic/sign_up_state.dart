import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/auth/sign_up/data/models/user_type_model.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = _Initial;

  const factory SignUpState.loadingUserTypes() = LoadingUserTypes;

  const factory SignUpState.loadedUserTypes(UserTypeModel userTypes) =
      LoadedUserTypes;

  const factory SignUpState.errorUserTypes(String message) = ErrorUserTypes;
}
