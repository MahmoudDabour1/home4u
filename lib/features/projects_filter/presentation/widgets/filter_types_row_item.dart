import 'package:flutter/material.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';

class FilterTypesRowItem extends StatelessWidget {
  final String projectType;
  final String projectTypeName;
  final Widget? availableWidget;
  const FilterTypesRowItem({super.key, required this.projectType, required this.projectTypeName,  this.availableWidget});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          projectType,
          style: AppStyles.font16BlackMedium,
        ),
        horizontalSpace(8),
       availableWidget?? Text(
          projectTypeName,
          style: AppStyles.font16BlackLight,
        ),
      ],
    );
  }
}
