import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_strings.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';
import 'package:home4u/features/auth/engineering_office/presentation/widgets/engineering_office_inputs.dart';
import 'package:home4u/features/auth/widgets/auth_welcome_data.dart';

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
                headText: AppStrings.engineeringOffice,
                subText: AppStrings.welcomeToHome4You,
              ),
              EngineeringOfficeInputs(),
              AppCustomButton(
                textButton: AppStrings.startButton,
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
