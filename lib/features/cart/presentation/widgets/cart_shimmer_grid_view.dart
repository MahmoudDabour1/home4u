import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';

class CartShimmerGridView extends StatelessWidget {
  const CartShimmerGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            direction: ShimmerDirection.rtl,
            child:Container(
              width: 180.w,
              height: 170.h,
              decoration: BoxDecoration(
                color: Colors.grey[300]!,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
              ),
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
                Skeletonizer(
                  enabled: true,
                  child: Expanded(
                    child: AutoSizeText(
                      "content?.name" ?? '',
                      style: AppStyles.font16BlackLight,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Skeletonizer(
                      enabled: true,
                      child: SvgPicture.asset(
                        AppAssets.starSvgImage,
                        width: 8.w,
                        height: 8.h,
                      ),
                    ),
                    verticalSpace(4.h),
                    Skeletonizer(
                      enabled: true,
                      child: Text(
                        "5.0",
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: AppColors.ratingColor,
                          fontWeight: FontWeight.w400,
                        ),
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
                Skeletonizer(
                  enabled: true,
                  child: Text(
                    '\$${"price" ?? 0}',
                    style: AppStyles.font16BlackMedium,
                  ),
                ),
                Skeletonizer(
                  enabled: true,
                  child: IconButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        AppColors.primaryColor,
                      ),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.r),
                        ),
                      ),
                    ),
                    icon: Icon(
                      Icons.add,
                      color: AppColors.whiteColor,
                      size: 24.w,
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 50.h,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       InkWell(
                //         onTap: () {},
                //         borderRadius: BorderRadius.circular(4.r),
                //         child: Padding(
                //           padding: EdgeInsets.all(4.w),
                //           child: Icon(
                //             Icons.remove,
                //             size: 18.w,
                //             color: AppColors.primaryColor,
                //           ),
                //         ),
                //       ),
                //       SizedBox(width: 4.w),
                //       Skeletonizer(
                //         enabled: true,
                //         child: Text(
                //           "2",
                //           style: AppStyles.font16BlackMedium,
                //         ),
                //       ),
                //       SizedBox(width: 4.w),
                //       InkWell(
                //         onTap: () {},
                //         borderRadius: BorderRadius.circular(4.r),
                //         child: Padding(
                //           padding: EdgeInsets.all(4.w),
                //           child: Icon(
                //             Icons.add,
                //             size: 18.w,
                //             color: AppColors.primaryColor,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
