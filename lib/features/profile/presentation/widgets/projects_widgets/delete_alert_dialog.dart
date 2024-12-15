import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/theming/app_strings.dart';
import 'package:home4u/features/profile/logic/profile_state.dart';

import '../../../../../core/helpers/helper_methods.dart';
import '../../../../../core/widgets/app_custom_alert_dialog.dart';
import '../../../logic/profile_cubit.dart';

class ProjectsDeleteAlertDialog extends StatelessWidget {
  final int projectId;

  const ProjectsDeleteAlertDialog({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final profileCubit = context.read<ProfileCubit>();
        return AppCustomAlertDialog(
          isLoading: state is DeleteProjectLoading,
          onDeleteButtonPressed: () async {
            final navigationBack = context.pop();
             await profileCubit.deleteProject(projectId);
            navigationBack;
            profileCubit.getProjects();
            await showToast(message: AppStrings.deletedSuccessfully);
          },
        );
      },
    );
  }
}
