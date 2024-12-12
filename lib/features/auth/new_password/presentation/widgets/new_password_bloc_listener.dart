import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/features/auth/new_password/logic/new_password_cubit.dart';
import 'package:home4u/features/auth/new_password/logic/new_password_state.dart';

import '../../../../../core/routing/routes.dart';

class NewPasswordBlocListener extends StatelessWidget {
  const NewPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewPasswordCubit, NewPasswordState>(
      listenWhen: (previous, current) =>
          current is NewPasswordLoading ||
          current is NewPasswordSuccess ||
          current is NewPasswordError,
      listener: (context, state) {
        state.whenOrNull(
          success: (newPasswordResponse) {
            context.pop();
            context.pushNamed(Routes.loginScreen);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
