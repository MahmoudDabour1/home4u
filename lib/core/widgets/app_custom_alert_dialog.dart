import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';

import '../../features/profile/presentation/widgets/delete_dialog_button_widget.dart';
import '../../locale/app_locale.dart';
import '../theming/app_colors.dart';
import '../theming/app_styles.dart';
import '../utils/spacing.dart';

class AppCustomAlertDialog extends StatelessWidget {
  final VoidCallback onDeleteButtonPressed;
  final bool isLoading;

  const AppCustomAlertDialog(
      {super.key,
      required this.onDeleteButtonPressed,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        AppLocale.areYouSureYouWantToDeleteThisItem.getString(context),
        style: AppStyles.font16BlackMedium,
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          children: [
            DeleteDialogButtonWidget(
              text: AppLocale.cancel.getString(context),
              backgroundColor: AppColors.secondaryGradientColor,
              onPressed: () {
                context.pop();
              },
            ),
            horizontalSpace(16),
            DeleteDialogButtonWidget(
              isLoading: isLoading,
              text: AppLocale.delete.getString(context),
              onPressed: onDeleteButtonPressed,
              isBoarder: true,
              backgroundColor: AppColors.whiteColor,
              textColor: AppColors.secondaryColor,
            ),
          ],
        ),
      ],
    );
  }
}
