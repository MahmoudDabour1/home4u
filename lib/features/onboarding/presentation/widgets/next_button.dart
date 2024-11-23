import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/core/theming/app_colors.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: CircleBorder(),
        fixedSize: Size(60.w, 60.h),
      ),
      child: SvgPicture.asset(
        AppAssets.arrowRightSvgImage,
      ),
    );
  }
}
