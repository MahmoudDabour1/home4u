import 'package:flutter/material.dart';

import '../theming/app_colors.dart';
import 'get_common_input_decoration.dart';

class AppCustomDropDownButtonFormField extends StatelessWidget {
  final String? value;
  final void Function(String?) onChanged;
  final List<DropdownMenuItem<String>> items;
  final String labelText;
  final FormFieldValidator<String>? validator;
  final void Function(String?)? onSaved;
  final Color? fillColor;
  final double? verticalPadding;
  final bool isEnabled;

  const AppCustomDropDownButtonFormField({
    super.key,
    required this.value,
    required this.onChanged,
    required this.items,
    required this.labelText,
    this.validator,
    this.onSaved,
    this.fillColor,
    this.verticalPadding,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: isEnabled,
      iconDisabledColor: AppColors.darkRedColor,

      value: value,
      icon: Icon(
        Icons.keyboard_arrow_down_outlined,
        color: AppColors.secondaryColor,
      ),
      items: items,
      onChanged: onChanged,
      onSaved: onSaved,
      decoration: getCommonInputDecoration(
        labelText: labelText,
        fillColor: fillColor,
        verticalPadding: verticalPadding,
      ),
      dropdownColor: Colors.white,
      validator: validator,
    );
  }
}
