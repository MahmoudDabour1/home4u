import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/theming/app_colors.dart';

class CartProductDetailsColorsListView extends StatelessWidget {
  const CartProductDetailsColorsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          AppLocale.color.getString(context),
          style: AppStyles.font16BlackBold,
        ),
        horizontalSpace(16),
        ...List.generate(
          7,
          (index) {
            return Container(
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
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
