import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/features/projects_filter/logic/projects_filter/projects_filter_cubit.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/tab_bar/projects_filter_custom_tab.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../locale/app_locale.dart';
import '../../projects_filter_screen.dart';

class ProjectsFilterTabBarWidget extends StatelessWidget {
  const ProjectsFilterTabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: (index) {
        final cubit = context.read<ProjectsFilterCubit>();
        switch (index) {
          case 0:
            cubit.changeTab(ProjectsFilterTabEnum.requestDesign);
            break;
          case 1:
            cubit.changeTab(ProjectsFilterTabEnum.renovateYourHouse);
            break;
          case 2:
            cubit.changeTab(ProjectsFilterTabEnum.customPackage);
            break;
          case 3:
            cubit.changeTab(ProjectsFilterTabEnum.askEngineer);
            break;
          case 4:
            cubit.changeTab(ProjectsFilterTabEnum.askTechnicalWorker);
            break;
        }
      },
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
          label: AppLocale.requestDesign.getString(context),
          iconPath: AppAssets.requestDesignIcon,
        ),
        ProjectsFilterCustomTab(
          label: AppLocale.renovateYourHouse.getString(context),
          iconPath: AppAssets.renovateYourHomeIcon,
        ),
        ProjectsFilterCustomTab(
          label: AppLocale.customPackage.getString(context),
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
