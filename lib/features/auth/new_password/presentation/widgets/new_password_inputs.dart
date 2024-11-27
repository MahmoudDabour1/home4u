import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_strings.dart';
 import '../../../../../core/widgets/app_text_form_field.dart';

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
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            AppTextFormField(
              labelText: AppStrings.newPassword,
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
                  return AppStrings.pleaseEnterAValidPassword;
                }
              },
            ),
            verticalSpace(16),
            AppTextFormField(
              labelText: AppStrings.confirmPassword,
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
                  return AppStrings.pleaseEnterAValidPassword;
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
