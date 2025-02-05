import 'package:flutter/material.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/features/profile/data/models/projects/get_projects_response_model.dart';

import '../../../../../core/routing/routes.dart';
import 'projects_custom_menu_and_dialog.dart';
import 'projects_delete_alert_dialog.dart';

class ProjectMenuButtonAndDialog extends StatelessWidget {
  final ProjectsData projectData;

  const ProjectMenuButtonAndDialog({super.key, required this.projectData});

  @override
  Widget build(BuildContext context) {
    return ProjectsCustomMenuAndDialog(
      deleteWidget: ProjectsDeleteAlertDialog(
        projectId: projectData.id!,
      ),
      onEdit: (){
        context.pushNamed(
          Routes.addProjectScreen,
          arguments: projectData,
        );
      },
    );
  }
}
