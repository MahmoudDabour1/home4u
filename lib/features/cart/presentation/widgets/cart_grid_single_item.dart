import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/features/cart/presentation/widgets/quantity_controller_button.dart';
import 'package:home4u/core/widgets/fancy_image.dart';
import 'package:home4u/core/networking/api_constants.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/utils/spacing.dart';
import '../../data/models/shop_now_response_model.dart';

class CartGridSingleItem extends StatelessWidget {
  final ShopNowContent? content;

  const CartGridSingleItem({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          FancyImage(
            imagePath: ApiConstants.getImageBaseUrl(content!.imagePath ?? ''),
            width: 180.w,
            height: 170.h,
            borderRadiusGeometry: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
          ),
          // Image.asset(
          //   'assets/images/Main_Product_ Image.png',
          //   // width: 180.w,
          //   height: 170.h,
          //   fit: BoxFit.cover,
          // ),
          verticalSpace(8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Expanded(
                  child: AutoSizeText(
                    content?.name ?? '',
                    style: AppStyles.font16BlackLight,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
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
                      content?.rate.toString() ?? '',
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
                  '\$${content!.price ?? 0}',
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
