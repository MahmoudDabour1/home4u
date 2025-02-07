import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_custom_circle_button.dart';

class ProfileUpperButtons extends StatelessWidget {
  const ProfileUpperButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 16.h),
      child: Row(
        children: [
          Spacer(),
          Row(
            children: [
              AppCustomCircleButton(
                imagePath: AppAssets.notificationSvgImage,
              ),
              horizontalSpace(8),
              AppCustomCircleButton(
                imagePath: AppAssets.settingSvgImage,
              )
            ],
          )
        ],
      ),
    );
  }
}
