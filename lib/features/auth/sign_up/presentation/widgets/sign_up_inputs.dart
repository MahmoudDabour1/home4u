import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_cubit.dart';

import '../../../../../core/helpers/app_regex.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../locale/app_locale.dart';
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
                    labelText: AppLocale.firstName.getString(context),
                    focusNode: firstNameFocusNode,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppLocale.enterValidName.getString(context);
                      }
                    },
                  ),
                ),
                horizontalSpace(8),
                Expanded(
                  child: AppTextFormField(
                    controller: context.read<SignUpCubit>().lastNameController,
                    labelText: AppLocale.lastName.getString(context),
                    focusNode: lastNameFocusNode,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppLocale.enterValidName.getString(context);
                      }
                    },
                  ),
                ),
              ],
            ),
            verticalSpace(16),
            AppTextFormField(
                controller: context.read<SignUpCubit>().emailController,
                labelText: AppLocale.emailAddress.getString(context),
                focusNode: emailFocusNode,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty || !AppRegex.isEmailValid(value)) {
                    return AppLocale.pleaseEnterAValidEmailAddress
                        .getString(context);
                  }
                }),
            verticalSpace(16),
            AppTextFormField(
                controller: context.read<SignUpCubit>().phoneController,
                labelText: AppLocale.phoneNumber.getString(context),
                focusNode: phoneNumberFocusNode,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value.isEmpty || !AppRegex.isPhoneNumberValid(value)) {
                    return AppLocale.pleaseEnterAValidPhoneNumber
                        .getString(context);
                  }
                }),
            verticalSpace(16),
            AppTextFormField(
              controller: context.read<SignUpCubit>().passwordController,
              labelText: AppLocale.password.getString(context),
              focusNode: passwordFocusNode,
              keyboardType: TextInputType.visiblePassword,
              isObscureText: isObscurePassword,
              validator: (value) {
                if (value.isEmpty) {
                  return AppLocale.pleaseEnterAValidPassword.getString(context);
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
              labelText: AppLocale.confirmPassword.getString(context),
              focusNode: confirmPasswordFocusNode,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,
              isObscureText: isObscureConfirmPassword,
              validator: (value) {
                if (value.isEmpty) {
                  return AppLocale.pleaseEnterAValidPassword.getString(context);
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
