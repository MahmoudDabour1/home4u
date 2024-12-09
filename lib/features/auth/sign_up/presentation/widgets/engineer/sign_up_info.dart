import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/auth/sign_up/presentation/widgets/engineer/engineer_sign_up_button.dart';

import '../../../../../../core/theming/app_strings.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../../core/widgets/app_text_form_field.dart';
import 'engineer_drop_down_buttons.dart';

class SignUpInfo extends StatefulWidget {
  const SignUpInfo({super.key});

  @override
  State<SignUpInfo> createState() => _SignUpInfoState();
}

class _SignUpInfoState extends State<SignUpInfo> {
  final engineerTypeFocusNode = FocusNode();
  final engineerServicesFocusNode = FocusNode();
  final engineerYearsOfExperienceFocusNode = FocusNode();
  String? selectedGovernorate;
  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
      child: Column(
        children: [
          verticalSpace(32),
          AppTextFormField(
            controller: TextEditingController(),
            labelText: AppStrings.yearsOfExperience,
            focusNode: engineerYearsOfExperienceFocusNode,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter your years of experience";
              }
            },
          ),
          verticalSpace(16),
          EngineerDropDownButtons(),
          verticalSpace(32),
          EngineerSignUpButton(),
        ],
      ),
    );
  }
}
