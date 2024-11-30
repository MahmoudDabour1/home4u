import 'package:bloc/bloc.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_state.dart';

import '../../../../core/networking/api_error_model.dart';
import '../data/models/user_type_model.dart';
import '../data/repos/sign_up_repository.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepository signUpRepository;

  SignUpCubit(this.signUpRepository) : super(const SignUpState.initial());

  void getUserTypes() async {
    emit(const SignUpState.loadingUserTypes());
    final userTypes = await signUpRepository.getUserTypes();
    userTypes.when(success: (data) {
      emit(SignUpState.successUserTypes(data));
    }, failure: (error) {
      emit(SignUpState.errorUserTypes(
          error: error.message ?? "An unknown error occurred"));
    });
  }
}
