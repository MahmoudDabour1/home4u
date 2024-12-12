import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/profile/presentation/widgets/projects_widgets/project_body_grid_view_item.dart';

class ProjectsGridView extends StatelessWidget {
  const ProjectsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 16.h,
          childAspectRatio: 1 / 1,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ProjectBodyGridViewItem();
        },
      ),
    );
  }
}
