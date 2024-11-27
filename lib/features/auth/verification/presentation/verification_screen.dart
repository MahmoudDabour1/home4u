import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';
import 'package:home4u/features/auth/verification/presentation/widgets/otp_inputs.dart';
import 'package:home4u/features/auth/verification/presentation/widgets/resend_otp.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_strings.dart';
import '../../widgets/auth_welcome_data.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthWelcomeData(
                headText: AppStrings.verification,
                subText: AppStrings.pleaseVerifyYourAccount,
              ),
              verticalSpace(32),
              OtpInputs(),
              verticalSpace(16),
              ResendOtp(),
              verticalSpace(32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
                child: AppCustomButton(
                  textButton: AppStrings.continue0,
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.newPasswordScreen);
                  },
                  btnHeight: 65.h,
                  btnWidth: MediaQuery.sizeOf(context).width,
                ),
              ),
              verticalSpace(32),
            ],
          ),
        ),
      ),
    );
  }
}
