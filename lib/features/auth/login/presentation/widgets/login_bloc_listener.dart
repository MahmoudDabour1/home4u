import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/helpers/shared_pref_helper.dart';
import 'package:home4u/core/helpers/shared_pref_keys.dart';
import 'package:home4u/features/auth/forget_password/logic/forget_password_cubit.dart';
import 'package:home4u/features/auth/login/logic/login_cubit.dart';
import 'package:home4u/features/auth/login/logic/login_state.dart';

import '../../../../../core/routing/routes.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
      current is LoginLoading ||
          current is LoginError ||
          current is LoginSuccess,
      listener: (context, state) {
        state.whenOrNull(
          success: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.bottomNavLayout);
          },
          error: (error) async {
            if (error == "Your account is not enabled" ||
                error == "حسابك غير مفعل.") {
              final forgetPasswordCubit = context.read<ForgetPasswordCubit>();
              final navigatorToVerificationScreen =
              context.pushNamed(Routes.verificationScreen);
              await SharedPrefHelper.setData(SharedPrefKeys.userEmailAddress,
                  context
                      .read<LoginCubit>()
                      .emailOrPhoneController
                      .text);
              await SharedPrefHelper.setData(
                  SharedPrefKeys.isFromForgetPassword, false);
              forgetPasswordCubit.emitForgetPasswordStates(
                await SharedPrefHelper.getString(
                    SharedPrefKeys.userEmailAddress),
              );
              navigatorToVerificationScreen;
            }
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
