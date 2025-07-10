import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/helpers/shared_pref_helper.dart';
import 'package:home4u/core/helpers/shared_pref_keys.dart';
import 'package:home4u/features/auth/verification/logic/verification_cubit.dart';

import '../../../../../core/routing/routes.dart';
import '../../logic/verification_state.dart';

class VerificationBlocListener extends StatelessWidget {
  const VerificationBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerificationCubit, VerificationState>(
      listenWhen: (previous, current) =>
          current is VerificationSuccess ||
          current is VerificationError ||
          current is VerificationLoading,
      listener: (context, state) {
        state.whenOrNull(
          success: (verificationResponse) async{
            context.pushNamed(
              await SharedPrefHelper.getBool(SharedPrefKeys.isFromForgetPassword)
                  ? Routes.newPasswordScreen
                  : Routes.loginScreen,
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
