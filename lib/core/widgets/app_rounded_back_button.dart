import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../localization/app_localization_cubit.dart';
import '../theming/app_assets.dart';
import '../theming/app_colors.dart';

class AppRoundedBackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AppRoundedBackButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final direction = context.read<AppLocalizationCubit>().textDirection;
    return Container(
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
        onPressed: onPressed,
        style: ButtonStyle(
          fixedSize: WidgetStateProperty.all<Size>(Size(50.w, 50.h)),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16).r),
          ),
        ),
        icon: SvgPicture.asset(
          direction == TextDirection.ltr
              ? AppAssets.arrowLeftSvgImage
              : AppAssets.arrowRightSvgImage,
          width: 25.w,
          height: 25.h,
          colorFilter:
              const ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn),
        ),
      ),
    );
  }
}
