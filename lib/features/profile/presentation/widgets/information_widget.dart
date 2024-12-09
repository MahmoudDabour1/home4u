import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/profile/presentation/widgets/profile_rating_widget.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/app_custom_button.dart';

class InformationWidget extends StatelessWidget {
  const InformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          verticalSpace(200),
          Text(
            "Mahmoud Dabour",
            style: AppStyles.font16BlackSemiBold,
          ),
          verticalSpace(8),
          Text(
            "Interior designer",
            style: AppStyles.font16BlackLight,
          ),
          verticalSpace(8),
          ProfileRatingWidget(),
          verticalSpace(8),
          Text(
            "An interior designer with experience in designing distinctive spaces.",
            style: AppStyles.font16BlackLight,
            textAlign: TextAlign.center,
          ),
          verticalSpace(8),
          AppCustomButton(
            textButton: "Edit Profile",
            btnWidth: 200.w,
            btnHeight: 30.h,
            onPressed: () {},
            radius: 25,
          ),
          verticalSpace(16),
        ],
      ),
    );
  }
}
