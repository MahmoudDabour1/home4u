import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/widgets/get_common_input_decoration.dart';

import '../theming/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  final String labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isObscureText;
  final TextEditingController? controller;
  final Function(String) validator;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final InputDecoration? decoration;
  final int? maxLines;

  const AppTextFormField({
    super.key,
    required this.labelText,
    this.suffixIcon,
    this.isObscureText,
    this.controller,
    required this.validator,
    this.prefixIcon,
    this.keyboardType,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.decoration,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      focusNode: focusNode,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      textInputAction: TextInputAction.next,
      decoration: decoration ?? getCommonInputDecoration(labelText: labelText),
      obscureText: isObscureText ?? false,
      style: AppStyles.font16BlackLight,
      validator: (value) {
        return validator(value!);
      },
      maxLines: maxLines,
      minLines: maxLines,
    );
  }
}
