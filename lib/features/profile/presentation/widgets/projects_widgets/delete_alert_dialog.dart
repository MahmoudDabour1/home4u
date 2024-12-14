import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/theming/app_strings.dart';
import 'package:home4u/features/profile/logic/profile_state.dart';

import '../../../../../core/helpers/helper_methods.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../logic/profile_cubit.dart';
import 'delete_dialog_button_widget.dart';

class DeleteAlertDialog extends StatelessWidget {
  final int projectId;

  const DeleteAlertDialog({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        AppStrings.areYouSureYouWantToDeleteThisItem,
        style: AppStyles.font16BlackMedium,
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          children: [
            DeleteDialogButtonWidget(
              text: AppStrings.cancel,
              onPressed: () {
                context.pop();
              },
            ),
            horizontalSpace(16),
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                final profileCubit = context.read<ProfileCubit>();
                return DeleteDialogButtonWidget(
                  isLoading: state is DeleteProjectLoading,
                  text: AppStrings.delete,
                  onPressed: () async {
                    final navigationBack = context.pop();
                    await profileCubit.deleteProject(projectId);
                    navigationBack;
                    profileCubit.getProjects();
                    await showToast(message: AppStrings.deletedSuccessfully);
                  },
                  isBoarder: true,
                  backgroundColor: AppColors.whiteColor,
                  textColor: AppColors.secondaryColor,
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
