import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:home4u/core/theming/app_strings.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/core/widgets/app_text_form_field.dart';
import 'engineer_drop_down_buttons.dart';
import 'engineer_sign_up_button.dart';

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
    final signUpCubit = context.read<SignUpCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
      child: Column(
        children: [
          verticalSpace(32),
          AppTextFormField(
            controller: signUpCubit.yearsOfExperienceController,
            labelText: AppStrings.yearsOfExperience,
            focusNode: engineerYearsOfExperienceFocusNode,
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
          EngineerDropDownButtons(),
          verticalSpace(32),
          EngineerSignUpButton(
            onPressed: () {
              final checkInputs = signUpCubit.formKey.currentState!.validate();
              signUpCubit.emitSignUp();
            },
          ),
        ],
      ),
    );
  }
}
