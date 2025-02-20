import 'package:flutter/material.dart';
import 'package:home4u/features/auth/verification/presentation/widgets/resend_otp.dart';
import 'package:home4u/features/auth/verification/presentation/widgets/verification_button.dart';

import '../../../../../core/utils/spacing.dart';
import 'otp_inputs.dart';

class VerificationBody extends StatelessWidget {
  const VerificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(32),
        OtpInputs(),
        verticalSpace(16),
        ResendOtp(),
        verticalSpace(32),
        VerificationButton(),
        verticalSpace(32),
      ],
    );
  }
}
