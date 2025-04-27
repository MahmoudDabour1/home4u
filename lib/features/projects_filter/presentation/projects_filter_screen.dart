import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/filter_by_category_list_view.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/filter_list_view.dart';

import '../../../core/theming/app_colors.dart';
import '../../../core/utils/spacing.dart';
import '../../../core/widgets/app_custom_filter_button.dart';
import '../../../core/widgets/app_custom_search_text_field.dart';
import '../../products/presentation/widgets/filter/filter_availability_section.dart';
import '../../products/presentation/widgets/filter/filter_buttons.dart';
import '../../products/presentation/widgets/filter/filter_drob_down_menu_buttons.dart';
import '../../products/presentation/widgets/filter/filter_header_widget.dart';
import '../../products/presentation/widgets/filter/filter_price_section.dart';
import '../../products/presentation/widgets/filter/filter_rating_section.dart';

class ProjectsFilterScreen extends StatefulWidget {
  const ProjectsFilterScreen({super.key});

  @override
  State<ProjectsFilterScreen> createState() => _ProjectsFilterScreenState();
}

class _ProjectsFilterScreenState extends State<ProjectsFilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(16),
                Row(
                  spacing: 16.w,
                  children: [
                    Expanded(
                      child: AppCustomSearchTextField(
                        fillColor: AppColors.offWhiteColor,
                      ),
                    ),
                    AppCustomFilterButton(
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                              builder:
                                  (BuildContext context, StateSetter setState) {
                                return SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.6,
                                  child: SingleChildScrollView(
                                    child: Container(
                                      padding: const EdgeInsets.all(16.0),
                                      // Use const here
                                      decoration: BoxDecoration(
                                        color: AppColors
                                            .scaffoldBusinessBackgroundColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.r),
                                          topRight: Radius.circular(20.r),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.w),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            verticalSpace(8),
                                            const FilterHeaderWidget(),
                                            // Use const here
                                            FilterDropDownMenuButtons(),
                                            FilterPriceSection(),
                                            FilterRatingSection(),
                                            FilterAvailabilitySection(),
                                            FilterButtons(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      backgroundColor: AppColors.offWhiteColor,
                    ),
                  ],
                ),
                verticalSpace(16),
                FilterByCategoryListView(),
                verticalSpace(32),
                Text(
                  "Projects",
                  style: AppStyles.font16BlackSemiBold,
                ),
                verticalSpace(32),
                FilterListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
