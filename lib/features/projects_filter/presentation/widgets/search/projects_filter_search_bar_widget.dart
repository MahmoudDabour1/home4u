import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/search/projects_filter_search_bar_filter_button.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/widgets/app_custom_search_text_field.dart';

class ProjectsFilterSearchBarWidget extends StatelessWidget {
  const ProjectsFilterSearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        spacing: 16.w,
        children: [
          Expanded(
            child: AppCustomSearchTextField(
              controller: TextEditingController(),
              fillColor: AppColors.offWhiteColor,
            ),
          ),
          ProjectsFilterSearchBarFilterButton(),
        ],
      ),
    );
  }
}
