import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_strings.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/core/widgets/app_custom_drop_down_button_form_field.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../sign_up/presentation/widgets/egypt_locations_list.dart';
import 'engineering_office_images_fields.dart';

class EngineeringOfficeInputs extends StatefulWidget {
  const EngineeringOfficeInputs({super.key});

  @override
  State<EngineeringOfficeInputs> createState() =>
      _EngineeringOfficeInputsState();
}

class _EngineeringOfficeInputsState extends State<EngineeringOfficeInputs> {
  String? scopeOfWork;
  String? enterTheBio;
  String? enterTheServices;
  String? section;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          verticalSpace(32),
          AppCustomDropDownButtonFormField(
            value: scopeOfWork,
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
                scopeOfWork = value;
              });
            },
            labelText: AppStrings.scopeOfWork,
          ),
          verticalSpace(16),
          AppCustomDropDownButtonFormField(
            value: enterTheBio,
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
                enterTheBio = value;
              });
            },
            labelText: AppStrings.enterTheBio,
          ),
          verticalSpace(16),
          AppCustomDropDownButtonFormField(
            value: enterTheServices,
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
                enterTheServices = value;
              });
            },
            labelText: AppStrings.enterTheServices,
          ),
          verticalSpace(16),
          EngineeringOfficeImagesFields(),
          verticalSpace(16),
          AppCustomDropDownButtonFormField(
            value: section,
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
                section = value;
              });
            },
            labelText: AppStrings.section,
          ),
          verticalSpace(32),
        ],
      ),
    );
  }
}
