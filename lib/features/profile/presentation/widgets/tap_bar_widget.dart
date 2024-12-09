import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/features/profile/presentation/widgets/projects_body.dart';

class TapBarWidget extends StatelessWidget {
  const TapBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  text: "Projects",
                ),
                Tab(
                  text: "Services",
                ),
                Tab(
                  text: "Pricing",
                ),
                Tab(
                  text: "Certifications",
                ),
              ],
              isScrollable: true,
              enableFeedback: true,
              splashBorderRadius: BorderRadius.circular(24.r),
              tabAlignment: TabAlignment.start,
              dividerColor: Colors.transparent,
              labelColor: Colors.white,
              labelStyle: AppStyles.font16BlackMedium,
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle: AppStyles.font16BlackLight,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                color: AppColors.secondaryColor,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ProjectsBody(),
                  Center(child: Text("Services Content")),
                  Center(child: Text("Pricing Content")),
                  Center(child: Text("Certifications Content")),
                ],
              ),
            ),
          ]

        ),

      ),
    );
  }
}
