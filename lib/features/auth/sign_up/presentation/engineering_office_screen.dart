import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/auth/sign_up/logic/engineering_office/engineering_office_cubit.dart';
import 'package:home4u/features/auth/sign_up/presentation/widgets/enigneering_office/engineering_office_drop_down_buttons.dart';
import 'package:home4u/features/auth/sign_up/presentation/widgets/enigneering_office/engineering_office_inputs.dart';
import 'package:home4u/features/auth/sign_up/presentation/widgets/enigneering_office/engineering_office_sign_up_button.dart';
import 'package:home4u/features/auth/widgets/auth_welcome_data.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../core/di/dependency_injection.dart';
import '../logic/sign_up_cubit.dart';

class EngineeringOfficeScreen extends StatelessWidget {
  const EngineeringOfficeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EngineeringOfficeCubit>(
      create: (context) => sl<EngineeringOfficeCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: context.read<SignUpCubit>().formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
                child: Column(
                  children: [
                    AuthWelcomeData(
                      headText: AppLocale.engineeringOffice.getString(context),
                      subText: AppLocale.welcomeToArchiSpace.getString(context),
                    ),
                    EngineeringOfficeInputs(),
                    EngineeringOfficeDropDownButtons(),
                    verticalSpace(32),
                    EngineeringOfficeSignUpButton(
                      onPressed: () {},
                    ),
                    verticalSpace(32),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
