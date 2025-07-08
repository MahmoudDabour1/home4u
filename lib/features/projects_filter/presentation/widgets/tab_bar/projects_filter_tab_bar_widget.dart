import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/tab_bar/projects_filter_custom_tab.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../locale/app_locale.dart';

class ProjectsFilterTabBarWidget extends StatelessWidget {
  const ProjectsFilterTabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      enableFeedback: true,
      splashBorderRadius: BorderRadius.circular(16.r),
      tabAlignment: TabAlignment.center,
      dividerColor: Colors.transparent,
      labelColor: AppColors.whiteColor,
      labelStyle: AppStyles.font16BlackMedium.copyWith(
        color: AppColors.whiteColor,
      ),
      unselectedLabelColor: Colors.black,
      unselectedLabelStyle: AppStyles.font16BlackMedium,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.secondaryColor,
      ),
      tabs: [
        ProjectsFilterCustomTab(
          label: AppLocale.furnishTitle.getString(context),
          iconPath: AppAssets.furnishYourHomeIcon,
        ),
        ProjectsFilterCustomTab(
          label: AppLocale.requestDesign.getString(context),
          iconPath: AppAssets.requestDesignIcon,
        ),
        ProjectsFilterCustomTab(
          label: AppLocale.kitchensAndDressing.getString(context),
          iconPath: AppAssets.kitchensAndDressingIcon,
        ),
        ProjectsFilterCustomTab(
          label: AppLocale.customPackage.getString(context),
          iconPath: AppAssets.renovateYourHomeIcon,
        ),
        ProjectsFilterCustomTab(
          label: AppLocale.renovateYourHouse.getString(context),
          iconPath: AppAssets.renovateYourHomeIcon,
        ),
        ProjectsFilterCustomTab(
          label: AppLocale.engineerTitle.getString(context),
          iconPath: AppAssets.askEngineerIcon,
        ),
        ProjectsFilterCustomTab(
          label: AppLocale.askTechnical.getString(context),
          iconPath: AppAssets.askTechnicalWorkerIcon,
        ),
      ],
    );
  }
}
