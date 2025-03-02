import 'package:flutter/material.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/core/theming/app_styles.dart';

class ProjectDetailsShowMoreInfoButton extends StatelessWidget {
  final VoidCallback onShowMoreInfo;

  const ProjectDetailsShowMoreInfoButton({super.key, required this.onShowMoreInfo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onShowMoreInfo,
      child: Column(
        children: [
          verticalSpace(16),
          Text(
            'View Project Information',
            style: AppStyles.font16DarkBlueBold.copyWith(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}