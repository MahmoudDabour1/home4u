import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/auth/widgets/custom_header_shape.dart';

import '../../../core/widgets/app_back_button.dart';

class AuthWelcomeData extends StatelessWidget {
  final bool isBackButton;
  final String headText;
  final String subText;

  const AuthWelcomeData({
    super.key,
    this.isBackButton = true,
    required this.headText,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomHeaderShape(),
        Column(
          children: [
            Text(
              headText,
              textAlign: TextAlign.center,
              style: AppStyles.font20WhiteBold,
            ),
            verticalSpace(8),
            Text(
              subText,
              textAlign: TextAlign.center,
              style: AppStyles.font16BlackLight.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
          ],
        ),
        isBackButton
            ? Positioned(
                top: 16.h,
                left: 24.w,
                bottom: 38.h,
                child: AppBackButton(),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
