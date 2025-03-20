import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/theming/app_styles.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../locale/app_locale.dart';

class FilterHeaderWidget extends StatelessWidget {
  const FilterHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              AppAssets.filterSvg,
              alignment: Alignment.center,
              width: 24.w,
              height: 24.h,
            ),
            horizontalSpace(6),
            Text(
              AppLocale.filter.getString(context),
              style: AppStyles.font24BlackMedium,
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.close,
              size: 24.r,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
