import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../locale/app_locale.dart';
 import '../../../../../core/widgets/app_text_form_field.dart';
import '../../logic/new_password_cubit.dart';

class NewPasswordInputs extends StatefulWidget {
  const NewPasswordInputs({super.key});

  @override
  State<NewPasswordInputs> createState() => _NewPasswordInputsState();
}

class _NewPasswordInputsState extends State<NewPasswordInputs> {
  bool isObscureConfirmPassword = true;
  bool isObscureNewPassword = true;
  final newPasswordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<NewPasswordCubit>().formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            AppTextFormField(
              controller: context.read<NewPasswordCubit>().newPasswordController,
              labelText: AppLocale.newPassword.getString(context),
              isObscureText: isObscureNewPassword,
              textInputAction: TextInputAction.next,
              focusNode: newPasswordFocusNode,
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureNewPassword = !isObscureNewPassword;
                  });
                },
                child: Icon(
                  isObscureNewPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppColors.iconsColor,
                  size: 24.r,
                ),
              ),
              prefixIcon: Icon(
                Icons.lock_open_outlined,
                size: 18.r,
                color: AppColors.iconsColor,
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return AppLocale.pleaseEnterAValidPassword.getString(context);
                }
              },
            ),
            verticalSpace(16),
            AppTextFormField(
              controller: context.read<NewPasswordCubit>().confirmPasswordController,
              labelText: AppLocale.confirmPassword.getString(context),
              isObscureText: isObscureConfirmPassword,
              textInputAction: TextInputAction.done,
              focusNode: confirmPasswordFocusNode,
              keyboardType: TextInputType.visiblePassword,
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
              prefixIcon: Icon(
                Icons.lock_open_outlined,
                size: 18.r,
                color: AppColors.iconsColor,
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return AppLocale.pleaseEnterAValidPassword.getString(context);
                }
                if (value != context.read<NewPasswordCubit>().newPasswordController.text) {
                  return AppLocale.passwordsDoNotMatch.getString(context);
                }
              },
            ),
            verticalSpace(32),
          ],
        ),
      ),
    );
  }
}
