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
          success: (loginResponse) => _handleSuccess(context, loginResponse),
          error: (error) => _handleError(context, error),
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void _handleSuccess(BuildContext context, dynamic loginResponse) {
    context.pop();
    final String userTypeCode =
        loginResponse.data?.user?.userType?.code;

    switch (userTypeCode) {
      case "EXHIBITION":
      case "STORE":
        context.pushNamed(Routes.productsScreen);
        break;
      case "TECHNICAL_WORKER":
      case "ENGINEER":
        context.pushNamed(Routes.bottomNavLayout);
        break;
      default:
        context.pushNamed(Routes.homeScreen);
    }
  }

  Future<void> _handleError(BuildContext context, String error) async {
    if (error == "Your account is not enabled" || error == "حسابك غير مفعل.") {
      final forgetPasswordCubit = context.read<ForgetPasswordCubit>();
      final loginCubit = context.read<LoginCubit>();

      await SharedPrefHelper.setData(
        SharedPrefKeys.userEmailAddress,
        loginCubit.emailOrPhoneController.text,
      );
      await SharedPrefHelper.setData(
          SharedPrefKeys.isFromForgetPassword, false);

      forgetPasswordCubit.emitForgetPasswordStates(
        await SharedPrefHelper.getString(SharedPrefKeys.userEmailAddress),
      );

      context.pushNamed(Routes.verificationScreen);
    }
  }
}
