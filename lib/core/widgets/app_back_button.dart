import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/core/theming/app_colors.dart';

import '../theming/app_assets.dart';

class AppBackButton extends StatelessWidget {
  void Function()? onPressed;

  AppBackButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed ??
          () {
            Navigator.of(context).pop();
          },
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.offWhiteColor,
          shape: BoxShape.circle,
        ),
        child: Align(
          alignment: Alignment.center,
          child: SvgPicture.asset(
            AppAssets.arrowLeftSvgImage,
            height: 20.h,
            width: 20.w,
          ),
        ),
      ),
    );
  }
}
