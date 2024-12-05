import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/features/auth/forget_password/logic/forget_password_cubit.dart';
import 'package:home4u/features/auth/forget_password/logic/forget_password_state.dart';

import '../../../../../core/routing/routes.dart';

class ForgetPasswordBlocListener extends StatelessWidget {
  const ForgetPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listenWhen: (previous, current) =>
          current is ForgetPasswordLoading ||
          current is ForgetPasswordError ||
          current is ForgetPasswordSuccess,
      listener: (context, state) {
        state.whenOrNull(
          success: (forgetPasswordResponse) {
            context.pop();
            context.pushNamed(Routes.verificationScreen);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
