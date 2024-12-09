import 'package:flutter/material.dart';
import 'package:home4u/core/widgets/app_custom_loading_indicator.dart';

import '../theming/app_colors.dart';
import 'get_common_input_decoration.dart';

class AppCustomDropDownButtonFormField extends StatelessWidget {
  final String? value;
  final void Function(String?) onChanged;
  final List<DropdownMenuItem<String>> items;
  final String labelText;
  final FormFieldValidator<String>? validator;
  final void Function(String?)? onSaved;

  const AppCustomDropDownButtonFormField({
    super.key,
    required this.value,
    required this.onChanged,
    required this.items,
    required this.labelText,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      value: value,
      icon: Icon(
        Icons.keyboard_arrow_down_outlined,
        color: AppColors.secondaryColor,
      ),
      items: items,
      onChanged: onChanged,
      onSaved: onSaved,
      decoration: getCommonInputDecoration(labelText: labelText),
      dropdownColor: Colors.white,
      validator: validator,
    );
  }
}
