import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';

import '../../../../../locale/app_locale.dart';

class TapBarWidget extends StatelessWidget {
  const TapBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.whiteColor,
      // floating: true,
      //  pinned: true,
      automaticallyImplyLeading: false,
      toolbarHeight: 0,
      bottom: TabBar(
        tabs:  [
          Tab(text: AppLocale.projects.getString(context)),
          Tab(text: AppLocale.services.getString(context)),
          Tab(text: AppLocale.about.getString(context)),
          Tab(text: AppLocale.certifications.getString(context)),
        ],
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        isScrollable: true,
        enableFeedback: true,
        splashBorderRadius: BorderRadius.circular(16.r),
        tabAlignment: TabAlignment.start,
        dividerColor: Colors.transparent,
        labelColor: AppColors.whiteColor,
        labelStyle: AppStyles.font16BlackMedium.copyWith(
          color: AppColors.whiteColor,
        ),
        unselectedLabelColor: Colors.grey,
        unselectedLabelStyle: AppStyles.font16BlackLight,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: AppColors.secondaryColor,
        ),
      ),
    );
  }
}
