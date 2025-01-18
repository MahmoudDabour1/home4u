import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/helpers/helper_methods.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/widgets/app_text_form_field.dart';
import 'package:home4u/features/profile/presentation/widgets/projects_widgets/delete_dialog_button_widget.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';

class ServicesAlertDialog extends StatelessWidget {
  const ServicesAlertDialog({super.key, this.isEdit = false});
  final bool isEdit;

  // final TextEditingController addServicesTextEditingController;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.whiteColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalSpace(20),
          Text(
            isEdit
                ? AppLocale.editService.getString(context)
                : AppLocale.addServices.getString(context),
            style: AppStyles.font16BlackMedium,
            textAlign: TextAlign.center,
          ),
          verticalSpace(35),
          AppTextFormField(
              labelText: AppLocale.services.getString(context),
              validator: (value) {}),
        ],
      ),
      actions: [
        Row(
          children: [
            DeleteDialogButtonWidget(
              text: isEdit
                  ? AppLocale.edit.getString(context)
                  : AppLocale.add.getString(context),
              onPressed: () async {
                context.pop();
                await showToast(message: isEdit ? "Edited" : "Added");
              },
              backgroundColor: AppColors.secondaryGradientColor,
            ),
            horizontalSpace(16),
            DeleteDialogButtonWidget(
                isBoarder: true,
                backgroundColor: AppColors.whiteColor,
                textColor: AppColors.secondaryColor,
                text: AppLocale.cancel.getString(context),
                onPressed: () {
                  context.pop();
                }),
          ],
        ),
      ],
    );
  }
}
