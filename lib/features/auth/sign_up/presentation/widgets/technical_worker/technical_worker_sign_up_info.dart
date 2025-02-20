import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/core/widgets/app_text_form_field.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_cubit.dart';

import '../../../../../../locale/app_locale.dart';
import 'technical_worker_drop_down_buttons.dart';
import 'technical_worker_sign_up_button.dart';

class TechnicalWorkerSignUpInfo extends StatefulWidget {
  const TechnicalWorkerSignUpInfo({super.key});

  @override
  State<TechnicalWorkerSignUpInfo> createState() =>
      _TechnicalWorkerSignUpInfoState();
}

class _TechnicalWorkerSignUpInfoState extends State<TechnicalWorkerSignUpInfo> {
  final technicalWorkerTypeFocusNode = FocusNode();
  final technicalWorkerServicesFocusNode = FocusNode();
  final technicalWorkerYearsOfExperienceFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignUpCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
      child: Column(
        children: [
          verticalSpace(32),
          AppTextFormField(
            controller: signUpCubit.yearsOfExperienceController,
            labelText: AppLocale.yearsOfExperience.getString(context),
            focusNode: technicalWorkerYearsOfExperienceFocusNode,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter your years of experience";
              }
              return null;
            },
          ),
          verticalSpace(16),
          TechnicalWorkerDropDownButtons(),
          verticalSpace(32),
          TechnicalWorkerSignUpButton(
            onPressed: () {
              final checkInputs = signUpCubit.formKey.currentState!.validate();
              if (checkInputs) {
                signUpCubit.emitSignUp();
              }
            },
          ),
        ],
      ),
    );
  }
}
