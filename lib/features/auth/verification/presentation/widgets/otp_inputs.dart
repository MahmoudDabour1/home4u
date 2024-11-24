import 'package:code_input/code_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';

import '../../../../../core/routing/routes.dart';

class OtpInputs extends StatelessWidget {
  const OtpInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CodeInput(
        length: 5,
        keyboardType: TextInputType.number,
        builder: CodeInputBuilders.rectangle(
            border: Border.all(color: AppColors.secondaryColor),
            color: Colors.white,
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
            ),
            emptySize: Size(63.w, 63.h),
            filledSize: Size(63.w, 63.h),
            totalSize: Size(63.w, 63.h),
            borderRadius: BorderRadius.circular(8.r)),
        spacing: 8.w,
        onDone: (value) {
          Navigator.pushNamed(context, Routes.newPasswordScreen);
        },
        onFilled: (value) {},
      ),
    );
  }
}
