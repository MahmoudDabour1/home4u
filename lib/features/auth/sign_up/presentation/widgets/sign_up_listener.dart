import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_state.dart';

import '../../../../../core/routing/routes.dart';

class SignUpListener extends StatelessWidget {
  const SignUpListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is SignUpLoadingState ||
          current is SignUpErrorState ||
          current is SignUpSuccessState,
      listener: (context, state) {
        state.whenOrNull(successSignUp: (signUpResponse) {
          context.pop();
          context.pushNamed(Routes.homeScreen);
        });
      },
      child: const SizedBox.shrink(),
    );
  }
}
