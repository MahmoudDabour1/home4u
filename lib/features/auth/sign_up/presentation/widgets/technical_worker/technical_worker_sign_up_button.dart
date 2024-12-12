import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';

import '../../../logic/sign_up_state.dart';

class TechnicalWorkerSignUpButton extends StatelessWidget {
  final VoidCallback onPressed;

  const TechnicalWorkerSignUpButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return AppCustomButton(
          isLoading: state is SignUpLoadingState,
          textButton: "Complete Sign Up",
          onPressed: onPressed,
          btnWidth: MediaQuery.sizeOf(context).width,
          btnHeight: 65.h,
        );
      },
    );
  }
}