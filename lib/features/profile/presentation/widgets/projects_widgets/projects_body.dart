import 'package:flutter/material.dart';
import 'package:home4u/features/profile/presentation/widgets/projects_widgets/projects_grid_view.dart';

import 'add_project_button.dart';
import 'get_projects_bloc_builder.dart';

class ProjectsBody extends StatelessWidget {
  const ProjectsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddProjectButton(),
        GetProjectsBlocBuilder(),
      ],
    );
  }
}
