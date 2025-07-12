import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class OrderTabBarWidget extends StatelessWidget {
  final TabController tabController;

  const OrderTabBarWidget({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      physics: const BouncingScrollPhysics(),
      labelPadding: EdgeInsets.symmetric(horizontal: 16.w),
      tabs: const [
        Tab(text: 'Pending'),
        Tab(text: 'Delivered'),
        Tab(text: 'Canceled'),
      ],
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      isScrollable: false,
      enableFeedback: true,
      splashBorderRadius: BorderRadius.circular(16.r),
      tabAlignment: TabAlignment.center,
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
    );
  }
}
