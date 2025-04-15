import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../locale/app_locale.dart';

class UserFavoriteItem extends StatelessWidget {
  const UserFavoriteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Image.asset(
            'assets/images/Main_Product_ Image.png',
            width: 100.w,
            height: 100.h,
            fit: BoxFit.cover,
          ),
        ),
        horizontalSpace(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Product Name',
              style: AppStyles.font16BlackMedium,
            ),
            verticalSpace(4.h),
            Text(
              '\$20.00',
              style: AppStyles.font16BlackBold,
            ),
            verticalSpace(16.h),
            GestureDetector(
              onTap: () {},
              child: Text(
                AppLocale.addToCart.getString(context),
                style: AppStyles.font16BlackMedium.copyWith(
                  color: Colors.blueAccent,
                ),
              ),
            )
          ],
        ),
        Spacer(),
        InkWell(
          onTap: () {},
          child: Container(
            width: 24.w,
            height: 24.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                width: 1.w,
              ),
            ),
            child: Icon(
              Icons.close,
              size: 16.w,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
