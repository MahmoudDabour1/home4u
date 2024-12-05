import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/helpers/shared_pref_helper.dart';
import 'package:home4u/core/helpers/shared_pref_keys.dart';
import 'package:home4u/features/auth/new_password/data/repos/new_password_repo.dart';

import '../../../../core/helpers/helper_methods.dart';
import 'new_password_state.dart';

class NewPasswordCubit extends Cubit<NewPasswordState> {
  final NewPasswordRepo _newPasswordRepo;

  NewPasswordCubit(this._newPasswordRepo)
      : super(const NewPasswordState.initial());

  static NewPasswordCubit get(context) => BlocProvider.of(context);
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitNewPasswordStates() async {
    emit(const NewPasswordState.loading());
    final response = await _newPasswordRepo.newPassword(
      await SharedPrefHelper.getString(SharedPrefKeys.userEmailAddress.toString()),
      newPasswordController.text,
    );
    response.when(
      success: (
        newPasswordResponse,
      ) async {
        await showToast(message: newPasswordResponse.data??"Password Changed Successfully");
        emit(NewPasswordState.success(newPasswordResponse));
      },
      failure: (error) async {
        final errorMessage = error.message ?? "An unknown error occurred";
        await showToast(message: errorMessage, isError: true);
        emit(
          NewPasswordState.error(error: errorMessage),
        );
      },
    );
  }
}
