import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/features/settings/presentation/widgets/settings_list_view_widget.dart';

import '../../../locale/app_locale.dart';
import '../../auth/widgets/auth_welcome_data.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthWelcomeData(
                headText: AppLocale.settings.getString(context),
                isBackButton: false,
                subText: '',
              ),
              SettingsListViewWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
