import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';

class ProjectSkillsNeededWidget extends StatelessWidget {
  const ProjectSkillsNeededWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      children: [
        ...List.generate(
          3,
          (index) {
            return Chip(
              label: Text(
                'Skill ${index + 1}',
                style: AppStyles.font16WhiteBold,
              ),
              backgroundColor: AppColors.primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            );
          },
        ),
      ],
    );
  }
}
