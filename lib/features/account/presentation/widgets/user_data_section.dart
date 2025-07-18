import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_custom_button.dart';

class UserDataSection extends StatelessWidget {
  const UserDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.r,
              backgroundColor: AppColors.grayColor.withValues(alpha: 0.2),
              backgroundImage: AssetImage("assets/images/user_placeholder.png"),
            ),
            horizontalSpace(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocale.user.getString(context),
                    style: AppStyles.font16BlackMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    AppLocale.email.getString(context),
                    style: AppStyles.font16BlackLight,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            horizontalSpace(8),
            AppCustomButton(
              textButton: AppLocale.edit.getString(context),
              btnWidth: 20.w,
              btnHeight: 20.h,
              isBorder: true,
              radius: 30.r,
              onPressed: () {},),
          ],
        ),
      ),
    );
  }
}
