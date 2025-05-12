import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';

class OrderStatusCard extends StatelessWidget {
  const OrderStatusCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 92.h,
      child: Card(
        color: AppColors.secondaryGradientColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 20.w,right: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your order is delivered",
                    style: AppStyles.font16WhiteBold,
                  ),
                  AutoSizeText(
                    "Rate product to get 5 points for collect.",
                    style: TextStyle(color: Colors.white),
                    // style: AppStyles.font14BlackLight.copyWith(
                    //   color: AppColors.whiteColor,
                    //   overflow: TextOverflow.ellipsis,
                    // ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            SvgPicture.asset(
              AppAssets.giftSvg,
              width: 50.w,
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }
}