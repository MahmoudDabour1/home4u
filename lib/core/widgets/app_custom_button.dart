import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';
import '../theming/app_styles.dart';

class AppCustomButton extends StatelessWidget {
  final String textButton;
  final double btnWidth;
  final double btnHeight;
  final VoidCallback onPressed;

  const AppCustomButton({
    super.key,
    required this.textButton,
    required this.btnWidth,
    required this.btnHeight,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16).r,
        gradient: LinearGradient(
          colors: [
            AppColors.secondaryGradientColor,
            AppColors.secondaryColor,
          ],
        ),
      ),
      child: TextButton(
        style: ButtonStyle(
          fixedSize: WidgetStateProperty.all<Size>(
            Size(
              btnWidth.w,
              btnHeight.h,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          textButton,
          style: AppStyles.font16WhiteBold,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
