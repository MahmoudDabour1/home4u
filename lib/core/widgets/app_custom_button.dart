import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';
import '../theming/app_styles.dart';
import 'app_custom_loading_indicator.dart';

class AppCustomButton extends StatelessWidget {
  final String textButton;
  final double btnWidth;
  final double btnHeight;
  final VoidCallback onPressed;
  final bool isLoading;
  final double radius;

  const AppCustomButton({
    super.key,
    required this.textButton,
    required this.btnWidth,
    required this.btnHeight,
    required this.onPressed,
    this.isLoading = false,
    this.radius=16
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius.r),
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
        child: isLoading
            ? AppCustomLoadingIndicator()
            : Text(
                textButton,
                style: AppStyles.font16WhiteBold,
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
