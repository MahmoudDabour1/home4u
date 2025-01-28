import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/features/profile/logic/project/project_cubit.dart';
import 'package:home4u/features/profile/logic/project/project_state.dart';

import '../../../../../core/helpers/helper_methods.dart';
import '../../../../../core/widgets/app_custom_alert_dialog.dart';
import '../../../../../locale/app_locale.dart';

class ProjectsDeleteAlertDialog extends StatelessWidget {
  final int projectId;

  const ProjectsDeleteAlertDialog({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectCubit, ProjectState>(
      builder: (context, state) {
        final projectCubit = context.read<ProjectCubit>();
        return AppCustomAlertDialog(
          isLoading: state is DeleteProjectLoading,
          onDeleteButtonPressed: () async {
            final navigationBack = context.pop();
            await projectCubit.deleteProject(projectId);
            navigationBack;
            projectCubit.getProjects();
            await showToast(
              message: AppLocale.deletedSuccessfully.getString(context),
            );
          },
        );
      },
    );
  }
}
