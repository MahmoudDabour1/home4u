import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:home4u/core/widgets/get_common_input_decoration.dart';

import '../theming/app_colors.dart';

class AppCustomDropDownMultiSelectButton extends StatelessWidget {
  final List<String> selectedValues;
  final void Function(List<String>) onChanged;
  final void Function(List<String>?)? onSaved;
  final List<String> items;
  final String labelText;
  final FormFieldValidator<List<String>>? validator;

  const AppCustomDropDownMultiSelectButton({
    super.key,
    required this.selectedValues,
    required this.onChanged,
    required this.items,
    required this.labelText,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>.multiSelection(
      mode: Mode.form,
      selectedItems: [...selectedValues],
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      items: (filter, loadProps) => Future.value(items),
      decoratorProps: DropDownDecoratorProps(
        decoration: getCommonInputDecoration(labelText: labelText),
      ),
      popupProps: PopupPropsMultiSelection.dialog(),
      clickProps: ClickProps(
        focusColor: Colors.red,
        hoverColor: AppColors.primaryColor,
      ),
    );
  }
}
