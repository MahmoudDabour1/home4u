import 'package:flutter/material.dart';
import 'package:home4u/core/theming/app_strings.dart';

import '../../../../../core/widgets/app_custom_add_button.dart';
import 'get_projects_bloc_builder.dart';

class ProjectsBody extends StatelessWidget {
  const ProjectsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppCustomAddButton(text: AppStrings.addProject, onPressed: () {}),
        GetProjectsBlocBuilder(),
      ],
    );
  }
}
