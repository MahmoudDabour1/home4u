import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home4u/core/theming/app_strings.dart';

import '../../../../../core/theming/app_styles.dart';

class ResendOtp extends StatefulWidget {
  const ResendOtp({super.key});

  @override
  State<ResendOtp> createState() => _ResendOtpState();
}

class _ResendOtpState extends State<ResendOtp> {
  final TextEditingController otpController = TextEditingController();
  int resendCooldown = 20; // Resend timer in seconds
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    startResendTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    otpController.dispose();
    super.dispose();
  }


  void startResendTimer() {
    setState(() {
      resendCooldown = 20; // Reset timer
    });
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (resendCooldown > 0) {
        setState(() {
          resendCooldown--;
        });
      } else {
        timer.cancel();
      }
    });
  }


  void resendOtp() {
    if (resendCooldown == 0) {
      startResendTimer();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Flexible(
          child: Text(
            resendCooldown > 0
                ? '${AppStrings.resendIn00}$resendCooldown'
                : AppStrings.didnReceiveTheOTP,
            style: TextStyle(fontSize: 14),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        if (resendCooldown == 0)
          TextButton(
            onPressed: resendOtp,
            child: Text(AppStrings.resendOTP,style: AppStyles.font16DarkBlueBold,overflow: TextOverflow.ellipsis,
              maxLines: 2,),
          ),
      ],
    );
  }
}