import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';

class OtherLoginButton extends StatelessWidget {
  final String image;
  final String text;
  const OtherLoginButton({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 32.w,
            height: 32.h,
          ),
          horizontalSpace(16),
          Text(
            text,
            style: AppStyles.font16DarkBlueBold,
          ),
        ],
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16.h)),
        shape: MaterialStateProperty.all(
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
