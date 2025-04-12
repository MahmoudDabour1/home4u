import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/auth/sign_up/logic/engineering_office/engineering_office_cubit.dart';
import 'package:home4u/features/auth/sign_up/logic/engineering_office/engineering_office_state.dart';

import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../../../../../../core/widgets/app_custom_drop_down_multi_select_button.dart';
import '../../../../../../locale/app_locale.dart';
import '../../../logic/sign_up_cubit.dart';

class EngineeringOfficeDropDownButtons extends StatefulWidget {
  const EngineeringOfficeDropDownButtons({super.key});

  @override
  State<EngineeringOfficeDropDownButtons> createState() =>
      _EngineeringOfficeDropDownButtonsState();
}

class _EngineeringOfficeDropDownButtonsState
    extends State<EngineeringOfficeDropDownButtons> {
  String? selectedEngineeringOfficeField;
  List<String>? selectedEngineeringOfficeDepartments;

  @override
  void initState() {
    super.initState();
    context.read<EngineeringOfficeCubit>().getEngineeringOfficeFields();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EngineeringOfficeCubit, EngineeringOfficeState>(
      builder: (context, state) {
        final engineeringOfficeCubit = context.read<EngineeringOfficeCubit>();
        final signUpCubit = context.read<SignUpCubit>();
        return Column(
          spacing: 16.h,
          children: [
            verticalSpace(8),
            AppCustomDropDownButtonFormField(
              value: selectedEngineeringOfficeField,
              items: engineeringOfficeCubit.engineeringOfficeFields
                  .map((engineeringField) {
                return DropdownMenuItem<String>(
                  value: engineeringField.id.toString(),
                  child: Text(
                    engineeringField.name,
                    style: AppStyles.font16BlackLight,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedEngineeringOfficeField = value;
                  selectedEngineeringOfficeDepartments = [];
                  signUpCubit.selectedEngineeringOfficeDepartments = [];
                  engineeringOfficeCubit
                      .getEngineeringOfficeServices(int.parse(value!));
                  signUpCubit.selectedEngineeringOfficeField =
                      int.parse(value);
                });
              },
              onSaved: (value) {
                signUpCubit.selectedEngineeringOfficeField =
                    int.parse(value!);
              },
              labelText: AppLocale.engineeringOfficeFields.getString(context),
            ),
            AppCustomDropDownMultiSelectButton(
              isEnabled:
                  engineeringOfficeCubit.engineeringOfficeFields.isNotEmpty,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "Please select at least one department";
                }
                return null;
              },
              selectedValues: selectedEngineeringOfficeDepartments ?? [],
              items: engineeringOfficeCubit.engineeringOfficeDepartments
                  .map((engineeringDepartment) {
                return engineeringDepartment.name ?? 'N/A';
              }).toList(),
              labelText:
                  AppLocale.engineeringOfficeDepartments.getString(context),
              onChanged: (List<String> values) {
                setState(() {
                  selectedEngineeringOfficeDepartments = values;
                  signUpCubit.selectedEngineeringOfficeDepartments =
                      values.map((name) {
                    return engineeringOfficeCubit.engineeringOfficeDepartments
                        .firstWhere((service) => service.name == name)
                        .id;
                  }).toList();
                });
              },
              onSaved: (value) {
                signUpCubit.selectedEngineeringOfficeDepartments =
                    value?.map((name) {
                  return engineeringOfficeCubit.engineeringOfficeDepartments
                      .firstWhere((service) => service.name == name)
                      .id;
                }).toList();
              },
            )
          ],
        );
      },
    );
  }
}
