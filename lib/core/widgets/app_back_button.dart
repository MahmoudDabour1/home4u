import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/core/theming/app_colors.dart';

import '../localization/app_localization_cubit.dart';
import '../theming/app_assets.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const AppBackButton({super.key, this.onPressed});

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
            context.read<AppLocalizationCubit>().textDirection ==
                    TextDirection.ltr
                ? AppAssets.arrowLeftSvgImage
                : AppAssets.arrowRightSvgImage,
            height: 20.h,
            width: 20.w,
          ),
        ),
      ),
    );
  }
}
