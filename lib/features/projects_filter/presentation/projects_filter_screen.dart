import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/tab_bar_body/renovate_house_tab_view_body.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/search/projects_filter_search_bar_widget.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/tab_bar/projects_filter_tab_bar_widget.dart';

import '../../../core/utils/spacing.dart';

// class ProjectsFilterScreen extends StatefulWidget {
//   const ProjectsFilterScreen({super.key});
//
//   @override
//   State<ProjectsFilterScreen> createState() => _ProjectsFilterScreenState();
// }
//
// class _ProjectsFilterScreenState extends State<ProjectsFilterScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 verticalSpace(16),
//                 Row(
//                   spacing: 16.w,
//                   children: [
//                     Expanded(
//                       child: AppCustomSearchTextField(
//                         fillColor: AppColors.offWhiteColor,
//                       ),
//                     ),
//                     AppCustomFilterButton(
//                       onPressed: () {
//                         showModalBottomSheet(
//                           isScrollControlled: true,
//                           context: context,
//                           builder: (BuildContext context) {
//                             return StatefulBuilder(
//                               builder:
//                                   (BuildContext context, StateSetter setState) {
//                                 return SizedBox(
//                                   height:
//                                       MediaQuery.sizeOf(context).height * 0.6,
//                                   child: SingleChildScrollView(
//                                     child: Container(
//                                       padding: const EdgeInsets.all(16.0),
//                                       // Use const here
//                                       decoration: BoxDecoration(
//                                         color: AppColors
//                                             .scaffoldBusinessBackgroundColor,
//                                         borderRadius: BorderRadius.only(
//                                           topLeft: Radius.circular(20.r),
//                                           topRight: Radius.circular(20.r),
//                                         ),
//                                       ),
//                                       child: Padding(
//                                         padding: EdgeInsets.symmetric(
//                                           horizontal: 16.w,
//                                         ),
//                                         child: Column(
//                                           mainAxisSize: MainAxisSize.min,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: <Widget>[
//                                             verticalSpace(8),
//                                             const FilterHeaderWidget(),
//                                             // Use const here
//                                             FilterDropDownMenuButtons(),
//                                             FilterPriceSection(),
//                                             FilterRatingSection(),
//                                             FilterAvailabilitySection(),
//                                             FilterButtons(),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             );
//                           },
//                         );
//                       },
//                       backgroundColor: AppColors.offWhiteColor,
//                     ),
//                   ],
//                 ),
//                 verticalSpace(16),
//                 FilterByCategoryListView(),
//                 verticalSpace(32),
//                 Text(
//                   "Projects",
//                   style: AppStyles.font16BlackSemiBold,
//                 ),
//                 verticalSpace(32),
//                 FilterListView(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   context.read<ProjectsFilterCubit>().getRequestDesignFilter();
//   //   context.read<ProjectsFilterCubit>().renovateHouseCustomPackages();
//   //   context.read<ProjectsFilterCubit>().askTechnicalWorkerFilter();
//   //   context.read<ProjectsFilterCubit>().askEngineerFilter();
//   //   context.read<ProjectsFilterCubit>().getFixedPackagesFilter();
//   // }
// }

class ProjectsFilterScreen extends StatefulWidget {
  const ProjectsFilterScreen({super.key});

  @override
  State<ProjectsFilterScreen> createState() => _ProjectsFilterScreenState();
}

class _ProjectsFilterScreenState extends State<ProjectsFilterScreen> {
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
                    preferredSize: Size.fromHeight(130.h),
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
              padding: const EdgeInsets.symmetric(horizontal: 16.0).h,
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Center(child: Text('Renovate House')),
                  Center(child: Text('Ask Technical Worker')),
                  Center(child: Text('Ask Engineer')),
                  RenovateHouseTabViewBody(),
                  Center(child: Text('Fixed Packages')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
