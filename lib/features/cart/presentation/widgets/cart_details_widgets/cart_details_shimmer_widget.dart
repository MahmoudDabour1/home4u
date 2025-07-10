import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../locale/app_locale.dart';
import 'expandable_text.dart';

class CartDetailsShimmerWidget extends StatelessWidget {
  const CartDetailsShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          direction: ShimmerDirection.rtl,
          child: Container(
            height: 350.h,
            width: double.infinity,
            color: Colors.grey[300]!,
          ),
        ),
        verticalSpace(32),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Skeletonizer(
                    enabled: true,
                    child: Expanded(
                      child: AutoSizeText(
                        "data.nameAr",
                        style: AppStyles.font24BlackMedium,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 12.w,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          color: AppColors.primaryColor,
                          size: 24.w,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                      ),
                      Skeletonizer(
                        enabled: true,
                        child: Text(
                          '15',
                          style: AppStyles.font16BlackMedium,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove,
                          color: AppColors.primaryColor,
                          size: 24.w,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpace(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Skeletonizer(
                    enabled: true,
                    child: Text(
                      "\$${"price"}",
                      style: AppStyles.font24BlackBold,
                    ),
                  ),
                  Row(
                    spacing: 8.w,
                    children: [
                      Skeletonizer(
                        enabled: true,
                        child: SvgPicture.asset(
                          AppAssets.starSvgImage,
                          width: 16.w,
                          height: 16.h,
                        ),
                      ),
                      Skeletonizer(
                        enabled: true,
                        child: Text(
                          "4.5",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              verticalSpace(16),
              Skeletonizer(
                enabled: true,
                child: ExpandableText(
                  text: "data.descriptionAr",
                ),
              ),
              verticalSpace(16),
              Skeletonizer(
                enabled: true,
                child: Text(
                  "product.data.businessType",
                  style: AppStyles.font16BlackLight,
                ),
              ),
              verticalSpace(16),
              Skeletonizer(
                enabled: true,
                child: Text(
                  "product.data.businessType",
                  style: AppStyles.font16BlackLight,
                ),
              ),
              verticalSpace(16),
              Skeletonizer(
                enabled: true,
                child: Text(
                  "product.data.businessType",
                  style: AppStyles.font16BlackLight,
                ),
              ),
              verticalSpace(16),
              Skeletonizer(
                enabled: true,
                child: Text(
                  "product.data.businessType",
                  style: AppStyles.font16BlackLight,
                ),
              ),
              verticalSpace(16),
              Row(
                spacing: 8.w,
                children: [
                  SvgPicture.asset(
                    AppAssets.stockSvg,
                    width: 16.w,
                    height: 16.h,
                  ),
                  Skeletonizer(
                    enabled: true,
                    child: Text(
                      "product.data.businessType",
                      style: AppStyles.font16BlackLight,
                    ),
                  ),
                ],
              ),
              verticalSpace(16),
              Wrap(
                children: [
                  Skeletonizer(
                    enabled: true,
                    child: Text(
                      AppLocale.color.getString(context),
                      style: AppStyles.font16BlackBold,
                    ),
                  ),
                  horizontalSpace(16),
                  ...List.generate(
                    2,
                    (index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: 30.w,
                          height: 30.h,
                          margin: EdgeInsetsDirectional.only(end: 8.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.grayColor,
                              width: 2.w,
                            ),
                          ),
                          child: Center(
                            child: Container(
                              width: 20.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              verticalSpace(32),
            ],
          ),
        ),
      ],
    );
  }
}
