import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/profile/data/models/projects/get_projects_response_model.dart';
import 'package:home4u/features/profile/presentation/widgets/projects_widgets/project_body_grid_view_item.dart';

class ProjectsGridView extends StatelessWidget {
  final List<ProjectsData?> projectsList;

  const ProjectsGridView({super.key, required this.projectsList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 1 / 1,
            ),
            itemCount: projectsList.length,
            itemBuilder: (context, index) {
              return ProjectBodyGridViewItem(
                projectData: projectsList[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
