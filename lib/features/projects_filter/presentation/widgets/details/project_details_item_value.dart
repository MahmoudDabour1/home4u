import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_styles.dart';

class ProjectDetailsItemValue extends StatelessWidget {
  final String itemTitle;
  final String value;

  const ProjectDetailsItemValue(
      {super.key, required this.itemTitle, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4.h,
      children: [
        Text(
          itemTitle,
          style: AppStyles.font16BlackMedium,
        ),
        Text(
          value,
          style: AppStyles.font16BlackLight,
        ),
      ],
    );
  }
}
