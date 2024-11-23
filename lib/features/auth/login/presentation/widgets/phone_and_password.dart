import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/app_regex.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_strings.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class PhoneAndPassword extends StatefulWidget {
  const PhoneAndPassword({super.key});

  @override
  State<PhoneAndPassword> createState() => _PhoneAndPasswordState();
}

class _PhoneAndPasswordState extends State<PhoneAndPassword> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          hintText: "phone number",
          validator: (value) {
            if (value.isEmpty ||
                value == null ||
                !AppRegex.isPhoneNumberValid(value)) {
              return "Please enter a valid phone number";
            }
          },
        ),
        verticalSpace(16),
        AppTextFormField(
          hintText: "password",
          validator: (value) {
            if (value.isEmpty || value == null) {
              return "Please Enter a valid Password";
            }
          },
          prefixIcon: Icon(Icons.lock_open_outlined,size: 16.r,color: AppColors.blackColor,),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isObscureText = !isObscureText;
              });
            },
            child: Icon(
              isObscureText ? Icons.visibility_off : Icons.visibility,
              color: AppColors.primaryColor,
            ),
          ),
        )
      ],
  final formKey = GlobalKey<FormState>();
  final phoneFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: AppStrings.phoneNumber,
            keyboardType: TextInputType.phone,
            focusNode:phoneFocusNode ,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return AppStrings.pleaseEnterAValidPhoneNumber;
              }
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            hintText: AppStrings.password,
            focusNode:passwordFocusNode ,
            textInputAction: TextInputAction.done,
            isObscureText: isObscureText,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              if (value.isEmpty) {
                return AppStrings.pleaseEnterAValidPassword;
              }
            },
            prefixIcon: Icon(Icons.lock_open_outlined,size: 16.r,color: AppColors.blackColor,),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
                color: AppColors.primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
