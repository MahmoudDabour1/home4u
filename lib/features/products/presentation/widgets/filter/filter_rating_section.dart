import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';

class FilterRatingSection extends StatefulWidget {
  const FilterRatingSection({super.key});

  @override
  State<FilterRatingSection> createState() => _FilterRatingSectionState();
}

class _FilterRatingSectionState extends State<FilterRatingSection> {
  int selectedRating = 4;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocale.rating.getString(context),
          style: AppStyles.font24BlackMedium,
        ),
        verticalSpace(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedRating = index + 1;
                });
              },
              child: Container(
                width: 60.w,
                height: 38.h,
                // margin: EdgeInsets.only(right: 8.w),
                decoration: BoxDecoration(
                  color: selectedRating == index + 1
                      ? AppColors.primaryColor
                      : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    width: 1.5.w,
                    color: selectedRating == index + 1
                        ? Colors.transparent
                        : AppColors.darkGrayColor,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.starSvgImage,
                      width: 15.w,
                      height: 15.h,
                    ),
                    horizontalSpace(8),
                    Text(
                      (index + 1).toString(),
                      style: AppStyles.font14DarkBlueBold.copyWith(
                        color: selectedRating == index + 1
                            ? AppColors.whiteColor
                            : AppColors.darkBlueColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
        verticalSpace(16),
      ],
    );
  }
}
