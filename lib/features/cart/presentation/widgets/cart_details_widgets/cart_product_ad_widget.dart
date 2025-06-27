import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';

class CartProductAdWidget extends StatelessWidget {
  const CartProductAdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(8),
        Container(
          height: 50.h,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: AppColors.grayColor,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(AppAssets.furnishYourHomeIcon),
                Expanded(
                  child: Text(
                    "HUAWEIHUAWEIHUAWEIHUAWEIHUAWEIHUAWEIHUAWEIHUAWEI",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppStyles.font14BlackMedium,
                  ),
                ),
                horizontalSpace(4),
                RichText(
                  text: TextSpan(
                    text: AppLocale.egp.getString(context),
                    style: AppStyles.font14BlackLight,
                    children: [
                      TextSpan(
                        text: '51,999',
                        style: AppStyles.font16BlackMedium,
                      ),
                    ],
                  ),
                ),
                horizontalSpace(8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20.r),
                      topLeft: Radius.circular(20.r),
                      bottomLeft: Radius.circular(20.r),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      AppLocale.express.getString(context),
                      style: AppStyles.font14BlackMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        verticalSpace(8),
      ],
    );
  }
}
