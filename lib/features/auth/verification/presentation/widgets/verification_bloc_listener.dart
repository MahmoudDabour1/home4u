import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/auth/verification/logic/verification_cubit.dart';

import '../../../../../core/routing/routes.dart';
import '../../logic/verification_state.dart';

class VerificationBlocListener extends StatelessWidget {
  const VerificationBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerificationCubit,VerificationState>(
        listenWhen: (previous, current) =>
            current is VerificationSuccess ||
            current is VerificationError ||
            current is VerificationLoading,
        listener: (context, state) {
         state.whenOrNull(
          success: (verificationResponse) {
            Navigator.pushNamed(context, Routes.newPasswordScreen);
          },
         );
        },
      child: const SizedBox.shrink(),
    );
  }
}
