import 'package:flutter/material.dart';
import 'package:home4u/core/utils/spacing.dart';

import '../../../../../core/theming/app_strings.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import 'egypt_locations_list.dart';

class DropDownButtons extends StatefulWidget {
  const DropDownButtons({super.key});

  @override
  State<DropDownButtons> createState() => _DropDownButtonsState();
}

class _DropDownButtonsState extends State<DropDownButtons> {
  String? selectedGovernorate;
  String? selectedCity;
  String? selectedAccountType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(16),
        AppCustomDropDownButtonFormField(
          value: selectedAccountType,
          items: accountTypes.map((String accountType) {
            return DropdownMenuItem<String>(
              value: accountType,
              child: Text(
                accountType,
                style: AppStyles.font16BlackLight,
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedAccountType = value;
            });
          },
          labelText: AppStrings.chooseYourAccountType,
        ),
        verticalSpace(16),
        AppCustomDropDownButtonFormField(
          value: selectedGovernorate,
          items: egyptLocations.keys.map((String governorate) {
            return DropdownMenuItem<String>(
              value: governorate,
              child: Text(
                governorate,
                style: AppStyles.font16BlackLight,
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedGovernorate = value;
              selectedCity = null;
            });
          },
          labelText: AppStrings.theGovernorate,
        ),
        verticalSpace(16),
        AppCustomDropDownButtonFormField(
            value: selectedCity,
            items: selectedGovernorate != null
                ? egyptLocations[selectedGovernorate]!.map((String city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Text(
                        city,
                        style: AppStyles.font16BlackLight,
                      ),
                    );
                  }).toList()
                : [],
            onChanged: (value) {
              setState(() {
                selectedCity = value;
              });
            },
            labelText: AppStrings.theCity),
        verticalSpace(16),
      ],
    );
  }
}
