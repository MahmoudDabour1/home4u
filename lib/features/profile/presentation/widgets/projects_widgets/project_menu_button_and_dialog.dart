import 'package:flutter/material.dart';

import '../profile_custom_menu_and_dialog.dart';
import 'projects_delete_alert_dialog.dart';

class ProjectMenuButtonAndDialog extends StatelessWidget {
  final int projectId;

  const ProjectMenuButtonAndDialog({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return ProfileCustomMenuAndDialog(
      widget: ProjectsDeleteAlertDialog(
        projectId: projectId,
      ),
    );
  }
}
