import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/core/widgets/app_custom_drop_down_button_form_field.dart';

import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../locale/app_locale.dart';
import '../egypt_locations_list.dart';
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
            labelText: AppLocale.scopeOfWork.getString(context),
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
            labelText: AppLocale.enterTheBio.getString(context),
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
            labelText: AppLocale.enterTheServices.getString(context),
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
            labelText: AppLocale.section.getString(context),
          ),
          verticalSpace(32),
        ],
      ),
    );
  }
}
