import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../theming/app_assets.dart';
import '../theming/app_colors.dart';

class AppCustomFilterButton extends StatelessWidget {
  final Color? backgroundColor;
  final VoidCallback onPressed;
  const AppCustomFilterButton({super.key, this.backgroundColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 53.w,
        height: 53.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: backgroundColor??AppColors.whiteColor,
        ),
        child: Align(
          child: SvgPicture.asset(
            AppAssets.filterSvg,
            width: 28.w,
            height: 28.h,
          ),
        ),
      ),
    );
  }
}
