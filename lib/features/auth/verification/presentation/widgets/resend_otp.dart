import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/features/auth/forget_password/logic/forget_password_cubit.dart';

import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/helpers/shared_pref_keys.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../locale/app_locale.dart';

class ResendOtp extends StatefulWidget {
  const ResendOtp({super.key});

  @override
  State<ResendOtp> createState() => _ResendOtpState();
}

class _ResendOtpState extends State<ResendOtp> {
  final TextEditingController otpController = TextEditingController();
  int resendCooldown = 60;
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
      resendCooldown = 60;
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

  void resendOtp() async {
    if (resendCooldown == 0) {
      context.read<ForgetPasswordCubit>().emitForgetPasswordStates(
            await SharedPrefHelper.getString(
              SharedPrefKeys.userEmailAddress,
            ),
          );
      startResendTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          resendCooldown > 0
              ? '${AppLocale.resendIn00.getString(context)}$resendCooldown'
              : AppLocale.didnReceiveTheOTP.getString(context),
          style: TextStyle(fontSize: 14),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        if (resendCooldown == 0)
          TextButton(
            onPressed: resendOtp,
            child: Text(
              AppLocale.resendOTP,
              style: AppStyles.font16DarkBlueBold,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
      ],
    );
  }
}
