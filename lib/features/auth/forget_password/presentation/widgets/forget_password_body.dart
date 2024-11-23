import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding:EdgeInsets.symmetric(horizontal: 24.w),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            verticalSpace(10),
            AppTextFormField(
                hintText: AppStrings.phoneNumber,
                validator: (value) {
                  if (value.isEmpty) {
                    return AppStrings.pleaseEnterAValidPhoneNumber;
                  }
                }),
            verticalSpace(32),
            AppCustomButton(
              textButton: AppStrings.send,
              btnWidth: MediaQuery.sizeOf(context).width,
              btnHeight: 65.h,
              onPressed: () {
                if (formKey.currentState!.validate()) {

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
