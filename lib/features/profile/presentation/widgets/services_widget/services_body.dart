import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/core/widgets/app_custom_add_button.dart';
import 'package:home4u/features/profile/presentation/widgets/services_widget/add_services_alert_dialog.dart';
import 'package:home4u/features/profile/presentation/widgets/services_widget/services_list_view.dart';
import 'package:home4u/locale/app_locale.dart';

class ServicesBody extends StatelessWidget {
  const ServicesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppCustomAddButton(
          text: AppLocale.addServices.getString(context),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AddServicesAlertDialog();
              },
            );
          },
        ),
        ServicesListView(),
      ],
    );
  }
}
