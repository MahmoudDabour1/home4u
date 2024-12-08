import 'package:flutter/material.dart';

import '../../../../../../core/helpers/app_regex.dart';
import '../../../../../../core/theming/app_strings.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../../core/widgets/app_text_form_field.dart';

class SignUpInfo extends StatefulWidget {
  const SignUpInfo({super.key});

  @override
  State<SignUpInfo> createState() => _SignUpInfoState();
}

class _SignUpInfoState extends State<SignUpInfo> {
  final engineerTypeFocusNode = FocusNode();
  final engineerServicesFocusNode = FocusNode();
  final engineerYearsOfExperienceFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(32),
        AppTextFormField(
          controller: TextEditingController(),
          labelText: AppStrings.emailAddress,
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

      ],
    );
  }
}
