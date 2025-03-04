import 'package:flutter/material.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/widgets/get_common_input_decoration.dart';

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
  final bool? enabled;

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
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      keyboardType: keyboardType,
      focusNode: focusNode,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      textInputAction: TextInputAction.next,
      decoration: decoration ??
          getCommonInputDecoration(
            labelText: labelText,
          ),
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
