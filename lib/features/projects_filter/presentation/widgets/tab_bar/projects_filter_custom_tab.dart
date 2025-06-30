import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectsFilterCustomTab extends StatelessWidget {
  final String iconPath;
  final String label;
  const ProjectsFilterCustomTab({super.key, required this.iconPath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: Row(
        spacing: 12.w,
        children: [
          Image.asset(
            iconPath,
            width: 36.w,
            height: 36.h,
          ),
          Text(label),
        ],
      ),
    );
  }
}
