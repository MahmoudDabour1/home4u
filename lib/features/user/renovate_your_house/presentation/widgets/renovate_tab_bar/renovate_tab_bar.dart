import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_styles.dart';

class RenovateTabBar extends StatelessWidget {
  const RenovateTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 0,
      backgroundColor: Colors.white,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: kToolbarHeight,
            child: TabBar(
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
                Tab(text: AppLocale.customPackage.getString(context)),
                Tab(text: AppLocale.fixedPackage.getString(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
