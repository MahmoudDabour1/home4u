import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_cubit.dart';

import '../../../../../core/helpers/app_regex.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_strings.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import 'drop_down_buttons.dart';

class SignUpInputs extends StatefulWidget {
  const SignUpInputs({super.key});

  @override
  State<SignUpInputs> createState() => _SignUpInputsState();
}

class _SignUpInputsState extends State<SignUpInputs> {
  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;
  final firstNameFocusNode = FocusNode();
  final lastNameFocusNode = FocusNode();
  final phoneNumberFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            verticalSpace(32),
            Row(
              children: [
                Expanded(
                  child: AppTextFormField(
                    controller: context.read<SignUpCubit>().firstNameController,
                    labelText: AppStrings.firstName,
                    focusNode: firstNameFocusNode,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppStrings.enterValidName;
                      }
                    },
                  ),
                ),
                horizontalSpace(8),
                Expanded(
                  child: AppTextFormField(
                    controller: context.read<SignUpCubit>().lastNameController,
                    labelText: AppStrings.lastName,
                    focusNode: lastNameFocusNode,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppStrings.enterValidName;
                      }
                    },
                  ),
                ),
              ],
            ),
            verticalSpace(16),
            AppTextFormField(
                controller: context.read<SignUpCubit>().emailController,
                labelText: AppStrings.emailAddress,
                focusNode: emailFocusNode,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty || !AppRegex.isEmailValid(value)) {
                    return AppStrings.pleaseEnterAValidEmailAddress;
                  }
                }),
            verticalSpace(16),
            AppTextFormField(
                controller: context.read<SignUpCubit>().phoneController,
                labelText: AppStrings.phoneNumber,
                focusNode: phoneNumberFocusNode,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value.isEmpty || !AppRegex.isPhoneNumberValid(value)) {
                    return AppStrings.pleaseEnterAValidPhoneNumber;
                  }
                }),
            verticalSpace(16),
            AppTextFormField(
              controller: context.read<SignUpCubit>().passwordController,
              labelText: AppStrings.password,
              focusNode: passwordFocusNode,
              keyboardType: TextInputType.visiblePassword,
              isObscureText: isObscurePassword,
              validator: (value) {
                if (value.isEmpty) {
                  return AppStrings.pleaseEnterAValidPassword;
                }
              },
              prefixIcon: Icon(
                Icons.lock_open_outlined,
                size: 18.r,
                color: AppColors.iconsColor,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscurePassword = !isObscurePassword;
                  });
                },
                child: Icon(
                  isObscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppColors.iconsColor,
                  size: 24.r,
                ),
              ),
            ),
            verticalSpace(16),
            AppTextFormField(
              controller:
                  context.read<SignUpCubit>().passwordConfirmationController,
              labelText: AppStrings.confirmPassword,
              focusNode: confirmPasswordFocusNode,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,
              isObscureText: isObscureConfirmPassword,
              validator: (value) {
                if (value.isEmpty) {
                  return AppStrings.pleaseEnterAValidPassword;
                } else if (value !=
                    context.read<SignUpCubit>().passwordController.text) {
                  return 'Passwords do not match';
                }
              },
              prefixIcon: Icon(
                Icons.lock_open_outlined,
                size: 18.r,
                color: AppColors.iconsColor,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureConfirmPassword = !isObscureConfirmPassword;
                  });
                },
                child: Icon(
                  isObscureConfirmPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppColors.iconsColor,
                  size: 24.r,
                ),
              ),
            ),
            DropDownButtons(),
          ],
        ),
      ),
    );
  }
}
