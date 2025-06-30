import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';

class ProjectServiceStatusValueItem extends StatelessWidget {
  final String projectStatus;

  const ProjectServiceStatusValueItem({super.key, required this.projectStatus});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Project Status : ",
          style: AppStyles.font16BlackBold,
        ),
        Row(
          children: [
            Icon(
              Icons.check_circle_outline,
              color: AppColors.blueColor,
              size: 16.r,
            ),
            horizontalSpace(4),
            Text(
              projectStatus,
              style: AppStyles.font16BlackLight.copyWith(
                color: AppColors.blueColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
