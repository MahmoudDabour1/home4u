import 'package:flutter/material.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/project_service_status_value_item.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';

class ServicesConstData extends StatelessWidget {
  final String government;

  final String projectStatus;

  const ServicesConstData({
    super.key,
    required this.government,
    required this.projectStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Government : ",
              style: AppStyles.font16BlackBold,
            ),
            Text(
              government,
              style: AppStyles.font16BlackBold,
            ),
          ],
        ),
        verticalSpace(16),
        ProjectServiceStatusValueItem(
          projectStatus: projectStatus,
        ),
      ],
    );
  }
}
