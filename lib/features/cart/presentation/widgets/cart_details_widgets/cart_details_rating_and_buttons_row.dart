import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/widgets/app_custom_love_container.dart';
import '../../../../../core/widgets/app_custom_rating_container.dart';

class CartDetailsRatingAndButtonsRow extends StatelessWidget {
  const CartDetailsRatingAndButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppCustomRatingContainer(
          rating: 4.6,
          reviewCount: 20.3,
          isDetailsScreen: true,
        ),
        Row(
          children: [
            AppCustomLoveContainer(onPressed: () {}),
            horizontalSpace(8),
            Container(
              width: 35.w,
              height: 35.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.whiteColor,
              ),
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.share,
                    // color: isFavorite ? Colors.red : AppColors.grayColor,
                    size: 20.h,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
