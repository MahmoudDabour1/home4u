import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';

import '../../../../../core/helpers/helper_methods.dart';
import '../../../../../core/widgets/app_custom_alert_dialog.dart';
import '../../../../../locale/app_locale.dart';
import '../../../logic/profile/profile_cubit.dart';
import '../../../logic/profile/profile_state.dart';

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
            await showToast(
              message: AppLocale.deletedSuccessfully.getString(context),
            );
          },
        );
      },
    );
  }
}
