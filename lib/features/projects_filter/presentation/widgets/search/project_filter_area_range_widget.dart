import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';

class ProjectFilterAreaRangeWidget extends StatelessWidget {
  final double minArea;
  final double maxArea;
  final void Function(RangeValues)? onChanged;

  const ProjectFilterAreaRangeWidget({
    super.key,
    required this.minArea,
    required this.maxArea,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: RangeValues(minArea, maxArea),
      min: 0,
      max: 1000,
      divisions: 20,
      activeColor: AppColors.primaryColor,
      overlayColor:
          WidgetStateProperty.resolveWith((states) => AppColors.whiteColor),
      labels: RangeLabels(
        "${minArea.toInt()}",
        "${maxArea.toInt()}",
      ),
      onChanged: onChanged,
    );
  }
}
