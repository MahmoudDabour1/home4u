import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:home4u/features/user/renovate_your_house/logic/renovate_your_house_cubit.dart';
import 'package:home4u/features/user/renovate_your_house/logic/renovate_your_house_state.dart';

import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../../../../../../locale/app_locale.dart';
import '../../../../../auth/sign_up/logic/sign_up_state.dart';

class RenovateCustomPackagesDropDownButtons extends StatefulWidget {
  const RenovateCustomPackagesDropDownButtons({super.key});

  @override
  State<RenovateCustomPackagesDropDownButtons> createState() =>
      _RenovateCustomPackagesDropDownButtonsState();
}

class _RenovateCustomPackagesDropDownButtonsState
    extends State<RenovateCustomPackagesDropDownButtons> {
  String? selectedWorkSkills;
  String? selectedGovernorate;
  String? selectedCity;
  String? selectedUnitType;
  String? selectedUnitStatus;
  String? selectedUnitWorkType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RenovateYourHouseCubit, RenovateYourHouseState>(
      builder: (context, state) {
        final cubit = context.read<RenovateYourHouseCubit>();
        final signUpCubit = context.read<SignUpCubit>();
        return Column(
          spacing: 16.h,
          children: [
            verticalSpace(16),
            AppCustomDropDownButtonFormField(
              value: cubit.selectedUnitType != null
                  ? cubit.unitTypes
                      .firstWhere(
                          (unitType) => unitType.id == cubit.selectedUnitType)
                      .id
                      .toString()
                  : selectedUnitType,
              items: cubit.unitTypes.map((unitType) {
                return DropdownMenuItem<String>(
                  value: unitType.id.toString(),
                  child: Text(
                    unitType.name,
                    style: AppStyles.font16BlackLight,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedUnitType = value;
                  cubit.selectedUnitType = int.parse(value!);
                });
              },
              onSaved: (value) {
                cubit.selectedUnitType = int.parse(value!);
              },
              labelText: AppLocale.unitType.getString(context),
            ),
            AppCustomDropDownButtonFormField(
              value: selectedWorkSkills,
              items: cubit.workSkills.map((skill) {
                return DropdownMenuItem<String>(
                  value: skill.id.toString(),
                  child: Text(
                    skill.name,
                    style: AppStyles.font16BlackLight,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedWorkSkills = value;
                  cubit.selectedWorkSkill = int.parse(value!);
                });
              },
              onSaved: (value) {
                cubit.selectedWorkSkill = int.parse(value!);
              },
              labelText: AppLocale.skills.getString(context),
            ),
            AppCustomDropDownButtonFormField(
              value: selectedUnitStatus,
              items: cubit.unitStatuses.map((unitStatus) {
                return DropdownMenuItem<String>(
                  value: unitStatus.id.toString(),
                  child: Text(
                    unitStatus.name,
                    style: AppStyles.font16BlackLight,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedUnitStatus = value;
                  cubit.selectedUnitStatus = int.parse(value!);
                });
              },
              onSaved: (value) {
                cubit.selectedUnitStatus = int.parse(value!);
              },
              labelText: AppLocale.unitStatus.getString(context),
            ),
            AppCustomDropDownButtonFormField(
              value: selectedUnitWorkType,
              items: cubit.unitWorkTypes.map((unitWorkType) {
                return DropdownMenuItem<String>(
                  value: unitWorkType.id.toString(),
                  child: Text(
                    unitWorkType.name,
                    style: AppStyles.font16BlackLight,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedUnitWorkType = value;
                  cubit.selectedUnitWorkType = int.parse(value!);
                });
              },
              onSaved: (value) {
                cubit.selectedUnitWorkType = int.parse(value!);
              },
              labelText: AppLocale.unitWorkType.getString(context),
            ),
            AppCustomDropDownButtonFormField(
              value: selectedGovernorate,
              items: cubit.governorates.map((governorate) {
                return DropdownMenuItem<String>(
                  value: governorate.id.toString(),
                  child: Text(
                    governorate.name,
                    style: AppStyles.font16BlackLight,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedGovernorate = value;
                  selectedCity = null;
                  signUpCubit.getCities(int.parse(value!));
                  cubit.selectedGovernorate = int.parse(value);
                });
              },
              labelText: AppLocale.theGovernorate.getString(context),
            ),
            BlocBuilder<SignUpCubit, SignUpState>(
              builder: (context, state) {
                final cities = signUpCubit.cities;

                return AppCustomDropDownButtonFormField(
                  value: selectedCity,
                  items: selectedGovernorate != null
                      ? cities.map((city) {
                          return DropdownMenuItem<String>(
                            value: city.id.toString(),
                            child: Text(
                              city.name,
                              style: AppStyles.font16BlackLight,
                            ),
                          );
                        }).toList()
                      : [],
                  onChanged: (value) {
                    setState(() {
                      selectedCity = value;
                      cubit.selectedCity = int.parse(value!);
                    });
                  },
                  labelText: AppLocale.theCity.getString(context),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
