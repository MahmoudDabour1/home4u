import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';

class ProjectSkillsNeededWidget extends StatelessWidget {
  final String skillNeeded;

  const ProjectSkillsNeededWidget({super.key, required this.skillNeeded});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        skillNeeded,
        style: AppStyles.font16WhiteBold,
      ),
      backgroundColor: AppColors.primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
    );
  }
}
