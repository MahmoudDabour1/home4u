
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/helpers/shared_pref_helper.dart';
import 'package:home4u/core/helpers/shared_pref_keys.dart';
import 'package:home4u/features/auth/verification/logic/verification_state.dart';

import '../../../../core/helpers/helper_methods.dart';
import '../data/repos/verification_repo.dart';

class VerificationCubit extends Cubit<VerificationState> {
  final VerificationRepo _verificationRepo;
  VerificationCubit(this._verificationRepo) : super(VerificationState.initial());
  static VerificationCubit get(context) => BlocProvider.of(context);

  String? otpValve;

  void emitVerificationStates() async {
    emit(const VerificationState.loading());
   final response = await _verificationRepo.verifyEmail(
     await SharedPrefHelper.getString(SharedPrefKeys.userEmailAddress.toString()),otpValve!.toString(),
   );
   response.when(
     success: (
       verificationResponse,
     ) async {
       await showToast(message: "Email Verified Successfully");
       emit(VerificationState.success(verificationResponse));
     },
     failure: (error) async {
       final errorMessage = error.message ?? "An unknown error occurred";
       await showToast(message: errorMessage, isError: true);
       emit(
         VerificationState.error(error: errorMessage),
       );
     },
   );
  }
}
