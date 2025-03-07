import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../theming/app_colors.dart';
import '../theming/app_styles.dart';

class AppCustomTextButtonWithIcon extends StatelessWidget {
  final String svgIcon;
  final Color? svgIconColor;
  final String text;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final double radius;
  final double btnWidth;
  final double btnHeight;
  final bool useGradient;
  final Color? backgroundColor;

  const AppCustomTextButtonWithIcon({
    super.key,
    required this.svgIcon,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.svgIconColor,
    this.radius = 16,
    this.btnWidth = double.infinity,
    this.btnHeight = 50,
    this.useGradient = true,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: btnWidth.w,
      height: btnHeight.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius.r
          ,
        ),
        border: useGradient ? null : Border.all(
          color: AppColors.secondaryColor,
          width: 1,
        ),
        color: useGradient ? null : (backgroundColor ?? AppColors.primaryColor),
        gradient: useGradient
            ? LinearGradient(
          colors: [
            AppColors.secondaryGradientColor,
            AppColors.secondaryColor,
          ],
        )
            : null,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius.r),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svgIcon,
              width: 24.w,
              height: 24.h,
              colorFilter: ColorFilter.mode(
                svgIconColor ?? AppColors.whiteColor,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 8.w),
            Flexible(
              child: Text(
                text,
                style: textStyle ?? AppStyles.font16WhiteBold,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
