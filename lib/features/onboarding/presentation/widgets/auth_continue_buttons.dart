import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_custom_button.dart';
import '../../../../locale/app_locale.dart';

class AuthContinueButtons extends StatelessWidget {
  final VoidCallback onPressedToSignUp;
  final VoidCallback onPressedToLogin;

  const AuthContinueButtons(
      {super.key,
      required this.onPressedToSignUp,
      required this.onPressedToLogin});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppCustomButton(
          textButton: AppLocale.signUp.getString(context),
          btnWidth: MediaQuery.sizeOf(context).width,
          btnHeight: 56.h,
          onPressed: onPressedToSignUp,
        ),
        verticalSpace(16),
        TextButton(
          style: ButtonStyle(
            fixedSize: WidgetStateProperty.all<Size>(
              Size(MediaQuery.sizeOf(context).width, 56.h),
            ),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0).r,
                side: BorderSide(
                  color: AppColors.primaryColor,
                  width: 1,
                ),
              ),
            ),
          ),
          onPressed: onPressedToLogin,
          child: Text(
            AppLocale.login.getString(context),
            style: AppStyles.font16WhiteBold.copyWith(
              color: AppColors.blackColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
