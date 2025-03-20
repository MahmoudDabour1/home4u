import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/profile/data/models/projects/get_projects_response_model.dart';
import 'package:home4u/features/profile/presentation/widgets/projects_widgets/project_body_grid_view_item.dart';

class ProjectDetailsProjectsGridView extends StatelessWidget {
  final GetProjectsResponseModel? projects;

  const ProjectDetailsProjectsGridView({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 1 / 1,
      ),
      itemCount: projects?.data?.length ?? 0,
      itemBuilder: (context, index) {
        return ProjectBodyGridViewItem(
          projectData: projects?.data?[index],
        );
      },
    );
  }
}