import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';

import '../../../../core/utils/spacing.dart';

class FilterByCategoryItem extends StatelessWidget {
  final String iconSvg;
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  const FilterByCategoryItem({
    super.key,
    required this.iconSvg,
    required this.title,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.30,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: isSelected
              ? AppColors.secondaryGradientColor
              : Colors.transparent,
          border: Border.all(
            color: AppColors.secondaryGradientColor,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              iconSvg,
              height: 20.h,
              width: 20.w,
            ),
            horizontalSpace(8),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppStyles.font14BlackMedium.copyWith(
                  color:
                      isSelected ? AppColors.whiteColor : AppColors.blackColor,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
