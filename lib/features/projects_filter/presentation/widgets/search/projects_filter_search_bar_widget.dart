import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/search/projects_filter_search_bar_filter_button.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/widgets/app_custom_search_text_field.dart';
import '../../../logic/projects_filter/projects_filter_cubit.dart';
import '../../projects_filter_screen.dart';

class ProjectsFilterSearchBarWidget extends StatelessWidget {
  const ProjectsFilterSearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        spacing: 16.w,
        children: [
          Expanded(
            child: AppCustomSearchTextField(
                controller:
                    context.read<ProjectsFilterCubit>().searchController,
                fillColor: AppColors.offWhiteColor,
                onFieldSubmitted: (_) {
                  final currentIndex =
                      DefaultTabController.of(context).index ?? 0;
                  final cubit = context.read<ProjectsFilterCubit>();
                  switch (cubit.currentTab) {
                    case ProjectsFilterTabEnum.requestDesign:
                      cubit.getRequestDesignFilter(isRefresh: true);
                      break;
                    case ProjectsFilterTabEnum.customPackage:
                      cubit.getFixedPackagesFilter(isRefresh: true);
                      break;
                    case ProjectsFilterTabEnum.renovateYourHouse:
                      cubit.renovateHouseCustomPackages(isRefresh: true);
                      break;
                    case ProjectsFilterTabEnum.askEngineer:
                      cubit.askEngineerFilter(isRefresh: true);
                      break;
                    case ProjectsFilterTabEnum.askTechnicalWorker:
                      cubit.askTechnicalWorkerFilter(isRefresh: true);
                      break;
                  }
                }),
          ),
          ProjectsFilterSearchBarFilterButton(),
        ],
      ),
    );
  }
}
