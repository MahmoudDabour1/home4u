import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/helpers/helper_methods.dart';
import 'package:home4u/core/theming/app_strings.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';

class AddProjectDetailsButton extends StatelessWidget {
  const AddProjectDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCustomButton(
      textButton: AppStrings.confirm,
      btnWidth: MediaQuery.sizeOf(context).width,
      btnHeight: 65.h,
      onPressed: () {},
    );
  }
}
