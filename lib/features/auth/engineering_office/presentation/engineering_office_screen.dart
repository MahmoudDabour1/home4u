import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';
import 'package:home4u/features/auth/engineering_office/presentation/widgets/engineering_office_inputs.dart';
import 'package:home4u/features/auth/widgets/auth_welcome_data.dart';
import 'package:home4u/locale/app_locale.dart';

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
                subText: AppLocale.welcomeToHome4You.getString(context),
              ),
              EngineeringOfficeInputs(),
              AppCustomButton(
                textButton: AppLocale.startButton.getString(context),
                btnWidth: MediaQuery.sizeOf(context).width,
                btnHeight: 65.h,
                onPressed: () {},
              ),
              verticalSpace(32),
            ],
          ),
        ),
      ),
    );
  }
}
