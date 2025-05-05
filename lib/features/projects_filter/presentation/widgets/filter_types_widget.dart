import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/filter_types_row_item.dart';

import '../../../../core/utils/spacing.dart';

class FilterTypesWidget extends StatelessWidget {
  const FilterTypesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterTypesRowItem(
          projectType: "Project Type:",
          projectTypeName: "Kitchens",
        ),
        verticalSpace(16),
        FilterTypesRowItem(
          projectType: "Kitchen Type:",
          projectTypeName: "American",
        ),
        verticalSpace(16),
        FilterTypesRowItem(
          projectType: "Government:",
          projectTypeName: "Cairo",
        ),
        verticalSpace(16),
        FilterTypesRowItem(
          projectType: "Project Status:",
          projectTypeName: "Kitchens",
          availableWidget: Row(
            children: [
              Icon(
                Icons.check_circle_outline,
                color: AppColors.blueColor,
                size: 16.r,
              ),
              horizontalSpace(4),
              Text(
                "available",
                style: AppStyles.font16BlackLight.copyWith(
                  color: AppColors.blueColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
