import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/features/profile/presentation/widgets/profile_rating_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_custom_button.dart';
import '../../../../locale/app_locale.dart';

class ProfileDataShimmer extends StatelessWidget {
  const ProfileDataShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            verticalSpace(200),
            Skeletonizer(
              enabled: true,
              child: Text(
                "Mahmoud Dabour",
                style: AppStyles.font16BlackSemiBold,
              ),
            ),
            verticalSpace(8),
            Skeletonizer(
              enabled: true,
              child: Text(
                "engineerData.data!.type!.name!",
                style: AppStyles.font16BlackLight,
              ),
            ),
            verticalSpace(8),
            ProfileRatingWidget(),
            verticalSpace(8),
            Skeletonizer(
              enabled: true,
              child: Text(
                "engineerData.data!.bio!",
                style: AppStyles.font16BlackLight,
                textAlign: TextAlign.center,
              ),
            ),
            verticalSpace(8),
            AppCustomButton(
              textButton: AppLocale.editProfile.getString(context),
              btnWidth: 200.w,
              btnHeight: 30.h,
              onPressed: () {},
              radius: 25,
            ),
            verticalSpace(16),
          ],
        ),
        Positioned(
          top: 70.h,
          left: MediaQuery.sizeOf(context).width / 2 - 51.w,
          child: Skeletonizer(
            enabled: true,
            child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              child: CircleAvatar(
                  radius: 51.r,
                  foregroundImage: AssetImage(AppAssets.facebook)),
            ),
          ),
        ),
      ],
    );
  }
}
