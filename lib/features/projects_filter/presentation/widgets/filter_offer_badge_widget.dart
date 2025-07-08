import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';

class FilterOfferBadgeWidget extends StatelessWidget {
  final String badgeCount;

  const FilterOfferBadgeWidget({super.key, required this.badgeCount});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 18.w,
      child: Stack(
        children: [
          SvgPicture.asset(AppAssets.saveBlackSvg),
          Column(
            children: [
              Text(
                badgeCount,
                style: AppStyles.font16BlackLight
                    .copyWith(color: AppColors.whiteColor),
              ),
              Text(
                AppLocale.offers.getString(context),
                style: AppStyles.font16BlackLight.copyWith(
                  color: AppColors.whiteColor,
                  fontSize: 14.sp,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
