import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/theming/app_strings.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:home4u/features/auth/sign_up/presentation/widgets/sign_up_buttons.dart';
import 'package:home4u/features/auth/sign_up/presentation/widgets/sign_up_inputs.dart';
import 'package:home4u/features/auth/sign_up/presentation/widgets/sign_up_listener.dart';

import '../../widgets/auth_welcome_data.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SignUpCubit>().getUserTypes();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthWelcomeData(
                headText: AppStrings.signUp,
                subText: AppStrings.welcomeBack,
                isBackButton: false,
              ),
              SignUpInputs(),
              verticalSpace(32),
              SignUpButtons(),
              SignUpListener(),
            ],
          ),
        ),
      ),
    );
  }
}
