import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import '../../../../../locale/app_locale.dart';

class AboutAlertDialog extends StatelessWidget {
  final String title;
  final VoidCallback onEditPress;
  final Widget alertContent;
  final bool isLoading;

  const AboutAlertDialog({
    super.key,
    required this.title,
    required this.onEditPress,
    required this.alertContent,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      content: Container(
        width: 345.w,
        padding: EdgeInsets.all(16.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: AppStyles.font16BlackMedium,
              textAlign: TextAlign.center,
            ),
            verticalSpace(16),
            alertContent,
            verticalSpace(32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AppCustomButton(
                    textButton: AppLocale.edit.getString(context),
                    btnWidth: 143.w,
                    btnHeight: 40.h,
                    onPressed: onEditPress,
                    isLoading: isLoading,
                  ),
                ),
                horizontalSpace(16),
                Expanded(
                  child: AppCustomButton(
                    textButton: AppLocale.cancel.getString(context),
                    btnWidth: 143.w,
                    btnHeight: 40.h,
                    isBorder: true,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
