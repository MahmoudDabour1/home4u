import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';

class ApplyPromoCodeButton extends StatelessWidget {
  const ApplyPromoCodeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 60.h,
        width: 60.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16).r,
          gradient: LinearGradient(
            colors: [
              AppColors.secondaryGradientColor,
              AppColors.secondaryColor,
            ],
          ),
        ),
        child: IconButton(
          onPressed: () {},
          style: ButtonStyle(
            fixedSize: WidgetStateProperty.all<Size>(Size(50.w, 50.h)),
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16).r),
            ),
          ),
          icon: SvgPicture.asset(
            AppAssets.arrowRightBlackSvg,
            width: 28.w,
            height: 28.h,
            colorFilter: const ColorFilter.mode(
                AppColors.whiteColor, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
