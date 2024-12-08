import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theming/app_strings.dart';
import '../../../../../../core/widgets/app_custom_button.dart';

class EngineerSignUpButton extends StatelessWidget {
  const EngineerSignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppCustomButton(
      textButton: AppStrings.signUp,
      btnHeight: 65.h,
      btnWidth: MediaQuery.sizeOf(context).width,
      onPressed: () {},
    );
  }
}
