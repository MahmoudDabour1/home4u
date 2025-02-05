import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/features/profile/presentation/widgets/edit_profile_inputs.dart';

import '../../../locale/app_locale.dart';
import '../../auth/widgets/auth_welcome_data.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthWelcomeData(
                headText: AppLocale.updateYourProfile.getString(context),
                subText: '',
              ),
              EditProfileInputs(),
            ],
          ),
        ),
      ),
    );
  }
}
