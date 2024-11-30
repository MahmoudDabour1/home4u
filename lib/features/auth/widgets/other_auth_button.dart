import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';

class OtherAuthButton extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onPressed;
  const OtherAuthButton({super.key, required this.image, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 32.w,
            height: 32.h,
          ),
          horizontalSpace(16),
          Flexible(
            child: Text(
              text,
              style: AppStyles.font16DarkBlueBold,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.symmetric(vertical: 16.h)),
        backgroundColor: WidgetStateProperty.all(AppColors.textFieldFillColor),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
            side: BorderSide(
              color: AppColors.secondaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
