import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/features/projects_filter/logic/projects_filter/projects_filter_cubit.dart';
import 'package:home4u/features/projects_filter/logic/projects_filter/projects_filter_state.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/search/project_filter_area_section.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/search/project_filter_buttons_widget.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/search/project_filter_duration_section.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/search/project_filter_price_section.dart';

import '../../../../../core/routing/router_observer.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_filter_button.dart';
import '../../../../products/presentation/widgets/filter/filter_header_widget.dart';
import '../../projects_filter_screen.dart';
import 'projects_filter_drop_down_menu.dart';

class ProjectsFilterSearchBarFilterButton extends StatefulWidget {
  const ProjectsFilterSearchBarFilterButton({
    super.key,
  });

  @override
  State<ProjectsFilterSearchBarFilterButton> createState() =>
      _ProjectsFilterSearchBarFilterButtonState();
}

class _ProjectsFilterSearchBarFilterButtonState
    extends State<ProjectsFilterSearchBarFilterButton> {
  @override
  Widget build(BuildContext context) {
    final projectFilterCubit = context.read<ProjectsFilterCubit>();
    return BlocBuilder<ProjectsFilterCubit, ProjectsFilterState>(
      builder: (context, state) {
        ProjectsFilterTabEnum currentTab = projectFilterCubit.currentTab;
        bool isInsideCompound = projectFilterCubit.isInsideCompound ?? false;
        return AppCustomFilterButton(
          onPressed: () {
            logger.w(currentTab);
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.7,
                      child: SingleChildScrollView(
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: AppColors.scaffoldBusinessBackgroundColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.r),
                              topRight: Radius.circular(20.r),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                verticalSpace(8),
                                FilterHeaderWidget(
                                  onClearPressed: () {
                                    context
                                        .read<ProjectsFilterCubit>()
                                        .resetFilter();
                                    context.pop();
                                  },
                                ),
                                ProjectsFilterDropDownMenu(),
                                if (currentTab ==
                                        ProjectsFilterTabEnum.requestDesign ||
                                    currentTab ==
                                        ProjectsFilterTabEnum
                                            .renovateYourHouse) ...[
                                  ProjectFilterPriceSection(),
                                  ProjectFilterAreaSection(),
                                  ProjectFilterDurationSection(),
                                ],
                                if (currentTab ==
                                    ProjectsFilterTabEnum.customPackage) ...[
                                  Row(
                                    children: [
                                      Text(
                                        "Is Inside Compound?",
                                        style: AppStyles.font16BlackMedium,
                                      ),
                                      Spacer(),
                                      Switch.adaptive(
                                        value: isInsideCompound,
                                        onChanged: (value) {
                                          isInsideCompound = value;
                                          projectFilterCubit.isInsideCompound =
                                              value;
                                          setState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                                if (currentTab ==
                                        ProjectsFilterTabEnum.askEngineer ||
                                    currentTab ==
                                        ProjectsFilterTabEnum
                                            .askTechnicalWorker) ...[
                                  ProjectFilterPriceSection(),
                                ],
                                ProjectFilterButtonsWidget(),
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
        );
      },
    );
  }
}
