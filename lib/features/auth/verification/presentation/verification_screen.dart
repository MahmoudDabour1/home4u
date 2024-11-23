import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';
import 'package:home4u/features/auth/verification/presentation/widgets/otp_inputs.dart';
import 'package:home4u/features/auth/verification/presentation/widgets/resend_otp.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_strings.dart';
import '../../widgets/auth_image_and_text_widget.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthImageAndTextWidget(
                image: AppAssets.verificationImage,
                text: AppStrings.verification,
                subText: AppStrings.pleaseVerifyYourAccount,
                isBackButton: true,
                horizontalPadding: 18,
              ),
              verticalSpace(10),
              OtpInputs(),
              verticalSpace(16),
              ResendOtp(),
              verticalSpace(32),
              AppCustomButton(
                textButton: AppStrings.continue0,
                onPressed: () {},
                btnHeight: 65.h,
                btnWidth: MediaQuery.sizeOf(context).width,
              ),
              verticalSpace(32),
            ],
          ),
        ),
      ),
    );
  }
}
