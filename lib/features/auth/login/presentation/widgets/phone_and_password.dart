import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/app_regex.dart';
import '../../../../../core/theming/app_colors.dart';
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
    );
  }
}
