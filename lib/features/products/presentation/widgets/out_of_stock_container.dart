import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../locale/app_locale.dart';
import '../../data/models/products_response_model.dart';

class OutOfStockContainer extends StatelessWidget {
  final Content? content;

  const OutOfStockContainer({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return content?.stockAmount!=0?SizedBox.shrink():Positioned(
      right: 16.w,
      top: 16.h,
      child: Container(
        width: 133.w,
        height: 40.h,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.outStockBackGroundColor,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                AppAssets.warningSvg,
                width: 16.w,
                height: 16.h,
                alignment: Alignment.center,
              ),
            ),
            Text(
              AppLocale.outOfStock.getString(context),
              style: AppStyles.font16GrayLight.copyWith(
                color: AppColors.darkRedColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}