import 'package:flutter/material.dart';
import 'package:home4u/features/profile/presentation/widgets/projects_widgets/projects_grid_view.dart';

import 'add_project_button.dart';

class ProjectsBody extends StatelessWidget {
  const ProjectsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddProjectButton(),
        ProjectsGridView(),
      ],
    );
  }
}
