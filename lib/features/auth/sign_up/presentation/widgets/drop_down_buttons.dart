import 'package:flutter/material.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/utils/spacing.dart';

import '../../../../../core/theming/app_strings.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/get_common_input_decoration.dart';
import 'egypt_locations_list.dart';

class DropDownButtons extends StatefulWidget {
  const DropDownButtons({super.key});

  @override
  State<DropDownButtons> createState() => _DropDownButtonsState();
}

class _DropDownButtonsState extends State<DropDownButtons> {
  String? selectedGovernorate;
  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(16),
        DropdownButtonFormField<String>(
          isExpanded: true,
          value: selectedGovernorate,
          icon: Icon(Icons.keyboard_arrow_down_outlined,color: AppColors.secondaryColor,),
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
          decoration:
              getCommonInputDecoration(labelText: AppStrings.theGovernorate),

          dropdownColor: Colors.white,
        ),
        verticalSpace(16),
        DropdownButtonFormField<String>(
          isExpanded: true,
          value: selectedCity,
          icon: Icon(Icons.keyboard_arrow_down_outlined,color: AppColors.secondaryColor,),
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
          decoration: getCommonInputDecoration(labelText: AppStrings.theCity),
          dropdownColor: Colors.white,
        ),
        verticalSpace(16),
      ],
    );
  }
}
