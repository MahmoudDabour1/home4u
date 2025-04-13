import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/features/auth/sign_up/logic/engineering_office/engineering_office_cubit.dart';
import 'package:home4u/features/auth/sign_up/presentation/widgets/enigneering_office/engineering_office_sign_up_info.dart';
import 'package:home4u/features/auth/widgets/auth_welcome_data.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../core/di/dependency_injection.dart';

class EngineeringOfficeScreen extends StatelessWidget {
  const EngineeringOfficeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthWelcomeData(
                headText: AppLocale.engineeringOffice.getString(context),
                subText: AppLocale.welcomeToArchiSpace.getString(context),
              ),
              EngineeringOfficeSignUpInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
