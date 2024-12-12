import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/core/theming/app_colors.dart';

class AppCustomCircleButton extends StatelessWidget {
  final String imagePath;
  void Function()? onPressed;

  AppCustomCircleButton({super.key, this.onPressed, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.offWhiteColor,
          shape: BoxShape.circle,
        ),
        child: Align(
          child: SvgPicture.asset(
            imagePath,
            height: 20.h,
            width: 20.w,
          ),
        ),
      ),
    );
  }
}
