import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../core/widgets/get_common_input_decoration.dart';

class UpDownFormField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String validationMessage;
  final double value;

  const UpDownFormField({
    super.key,
    required this.label,
    required this.controller,
    required this.focusNode,
    required this.validationMessage,
    this.value = 0.0,
  });

  @override
  State<UpDownFormField> createState() => _UpDownFormFieldState();
}

class _UpDownFormFieldState extends State<UpDownFormField> {
  void _increment() {
    setState(() {
      widget.controller.text =
          (double.parse(widget.controller.text) + 1).toString();
    });
  }

  void _decrement() {
    setState(() {
      if (double.parse(widget.controller.text) > 0) {
        widget.controller.text =
            (double.parse(widget.controller.text) - 1).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: widget.controller,
      labelText: widget.label,
      focusNode: widget.focusNode,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value.isEmpty || double.parse(value) == 0) {
          return widget.validationMessage;
        }
        return null;
      },
      decoration: getCommonInputDecoration(
        labelText: widget.label,
        suffixIcon: Column(
          children: [
            GestureDetector(
              onTap: _increment,
              child: SvgPicture.asset(
                AppAssets.arrowUpSvg,
                width: 24.0.w,
                height: 24.0.h,
              ),
            ),
            GestureDetector(
              onTap: _decrement,
              child: SvgPicture.asset(
                AppAssets.arrowDownSvg,
                width: 24.0.w,
                height: 24.0.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
