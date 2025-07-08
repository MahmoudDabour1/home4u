import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/project_service_status_value_item.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';

class ServicesConstData extends StatelessWidget {
  final String? government;

  final String projectStatus;

  const ServicesConstData({
    super.key,
    this.government,
    required this.projectStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing : 16.h,
      children: [
        government == null ? SizedBox.shrink() : Row(
          children: [
            Text(
              "Government : ",
              style: AppStyles.font16BlackBold,
            ),
            Text(
              government ?? "N/A",
              style: AppStyles.font16BlackBold,
            ),
          ],
        ),
        ProjectServiceStatusValueItem(
          projectStatus: projectStatus,
        ),
      ],
    );
  }
}
