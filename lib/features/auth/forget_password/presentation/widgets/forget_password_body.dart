import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/app_regex.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_strings.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            verticalSpace(32),
            AppTextFormField(
                labelText: AppStrings.phoneNumber,
                validator: (value) {
                  if (value.isEmpty || !AppRegex.isPhoneNumberValid(value)) {
                    return AppStrings.pleaseEnterAValidPhoneNumber;
                  }
                },
              keyboardType: TextInputType.phone,
            ),
            verticalSpace(32),
            AppCustomButton(
              textButton: AppStrings.send,
              btnWidth: MediaQuery.sizeOf(context).width,
              btnHeight: 65.h,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, Routes.verificationScreen);
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
