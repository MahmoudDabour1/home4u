import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/profile/data/models/projects/get_projects_response_model.dart';
import 'package:home4u/features/profile/presentation/widgets/projects_widgets/project_body_grid_view_item.dart';
import 'package:lottie/lottie.dart';

class ProjectsGridView extends StatelessWidget {
  final List<ProjectsData?>? projectsList;

  const ProjectsGridView({super.key, required this.projectsList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (projectsList?.isEmpty ?? true)
          Lottie.asset(
            "assets/jsons/empty_list.json",
            height: 200.h,
          )
        else
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
            itemCount: projectsList?.length??0,
            itemBuilder: (context, index) {
              return ProjectBodyGridViewItem(
                projectData: projectsList?[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
