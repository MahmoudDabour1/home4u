import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/features/cart/presentation/widgets/quantity_controller_button.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/utils/spacing.dart';

class CartGridSingleItem extends StatelessWidget {
  const CartGridSingleItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270.h,
      width: 170.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
            child: Image.asset(
              'assets/images/Main_Product_ Image.png',
              width: 170.w,
              height: 170.h,
              fit: BoxFit.cover,
            ),
          ),
          verticalSpace(8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Text(
                  'Product Name',
                  style: AppStyles.font16BlackLight,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.starSvgImage,
                      width: 8.w,
                      height: 8.h,
                    ),
                    verticalSpace(4.h),
                    Text(
                      '4.5',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: AppColors.ratingColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpace(8.h),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: 8.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '\$1000',
                  style: AppStyles.font16BlackMedium,
                ),
                QuantityControllerButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
