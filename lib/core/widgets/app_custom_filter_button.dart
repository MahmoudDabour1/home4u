import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../theming/app_assets.dart';

class AppCustomFilterButton extends StatelessWidget {
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final int badgeCount;

  const AppCustomFilterButton({
    super.key,
    this.backgroundColor,
    required this.onPressed,
    this.badgeCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(
        minWidth: 53.w,
        minHeight: 53.h,
      ),
      icon: Badge.count(
        count: badgeCount,
        isLabelVisible: badgeCount > 0,
        child: SvgPicture.asset(
          AppAssets.filterSvg,
          width: 28.w,
          height: 28.h,
        ),
      ),
    );
  }
}
