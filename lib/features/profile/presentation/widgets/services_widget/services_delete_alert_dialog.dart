
import 'package:flutter/material.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';

import '../../../../../core/helpers/helper_methods.dart';
import '../../../../../core/theming/app_strings.dart';
import '../../../../../core/widgets/app_custom_alert_dialog.dart';

class ServicesDeleteAlertDialog extends StatelessWidget {
  const ServicesDeleteAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCustomAlertDialog(
      isLoading: false,
      onDeleteButtonPressed: () async {
        final navigationBack = context.pop();
        navigationBack;
        await showToast(message: AppStrings.deletedSuccessfully);
      },
    );
  }
}
