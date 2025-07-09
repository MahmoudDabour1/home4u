import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/features/projects_filter/logic/projects_filter/projects_filter_cubit.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/search/projects_filter_search_bar_widget.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/tab_bar/projects_filter_tab_bar_widget.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/tab_bar_body/ask_engineer_tab_view_body.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/tab_bar_body/ask_technical_tab_view_body.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/tab_bar_body/renovate_house_custom_package_tab_view_body.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/tab_bar_body/renovate_house_tab_view_body.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/tab_bar_body/request_design_tab_view_body.dart';

import '../../../core/utils/spacing.dart';
import '../../auth/sign_up/logic/sign_up_cubit.dart';
import '../../user/renovate_your_house/logic/renovate_your_house_cubit.dart';

class ProjectsFilterScreen extends StatefulWidget {
  const ProjectsFilterScreen({super.key});

  @override
  State<ProjectsFilterScreen> createState() => _ProjectsFilterScreenState();
}

class _ProjectsFilterScreenState extends State<ProjectsFilterScreen> {
  @override
  void initState() {
    super.initState();
    context.read<RenovateYourHouseCubit>().getRenovateYourHouseLookUps();
    context.read<SignUpCubit>().getGovernorates();
    context.read<ProjectsFilterCubit>().getAllCustomPackageLookUp();
    context.read<ProjectsFilterCubit>().getAskEngineerLookUp();
    context.read<ProjectsFilterCubit>().getAskWorkerLookUp();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (_, __) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  elevation: 1,
                  title: Text(
                    'Projects',
                    style: AppStyles.font20BlackMedium,
                  ),
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  floating: true,
                  pinned: true,
                  forceElevated: true,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(140.h),
                    child: Column(
                      children: [
                        ProjectsFilterSearchBarWidget(),
                        verticalSpace(16),
                        ProjectsFilterTabBarWidget(),
                        verticalSpace(16),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: Padding(
              padding: EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                bottom: 16.h,
              ),
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  // ///ToDo : Mostafa
                  // FurnishHouseTabViewBody(),

                  RequestDesignTabViewBody(),

                  // ///ToDo : Mostafa
                  // Center(child: Text('Kitchen && Dressing')),
                  RenovateHouseTabViewBody(),
                  RenovateHouseCustomPackageTabViewBody(),

                  AskEngineerTabViewBody(),
                  AskTechnicalTabViewBody(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum ProjectsFilterTabEnum {
  furnishYourHome,
  requestDesign,
  kitchensAndDressing,
  customPackage,
  renovateYourHouse,
  askEngineer,
  askTechnicalWorker,
}