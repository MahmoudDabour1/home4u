import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/features/ask_engineer/logic/ask_engineer_cubit.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_cubit.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../../../../locale/app_locale.dart';
import '../../logic/ask_engineer_state.dart';

class AskEngineerDropDownButtons extends StatefulWidget {
  const AskEngineerDropDownButtons({super.key});

  @override
  State<AskEngineerDropDownButtons> createState() =>
      _AskEngineerDropDownButtonsState();
}

class _AskEngineerDropDownButtonsState
    extends State<AskEngineerDropDownButtons> {
  String? selectEngineerType;
  String? selectUnitType;
  String? selectedGovernorate;
  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AskEngineerCubit, AskEngineerState>(
      builder: (context, state) {
        final askEngineerCubit = context.read<AskEngineerCubit>();
        final signUpCubit = context.read<SignUpCubit>();
        return Column(
          children: [
            verticalSpace(16),
            AppCustomDropDownButtonFormField(
              value: selectEngineerType,
              items: askEngineerCubit.engineerTypesList.map((engineeringType) {
                return DropdownMenuItem<String>(
                  value: engineeringType.id.toString(),
                  child: Text(
                    engineeringType.name ?? '',
                    style: AppStyles.font16BlackLight,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  askEngineerCubit. selectEngineerType = value;
                });
              },
              labelText: AppLocale.engineeringTypeSelection.getString(context),
            validator: (value) {
                if (value == null) {
                  return AppLocale.pleaseSelectEngineeringType.getString(context);
                }
                return null;
              },
            ),
            verticalSpace(16),
            AppCustomDropDownButtonFormField(
              value: selectUnitType,
              items: askEngineerCubit.unitTypesList.map((unitType) {
                return DropdownMenuItem<String>(
                  value: unitType.id.toString(),
                  child: Text(
                    unitType.name ?? '',
                    style: AppStyles.font16BlackLight,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  askEngineerCubit. selectUnitType = value;
                });
              },
              labelText: AppLocale.unitTypeSelection.getString(context),
           validator: (value) {
                if (value == null) {
                  return AppLocale.pleaseSelectUnitType.getString(context);
                }
                return null;
              },

            ),
            verticalSpace(16),
            AppCustomDropDownButtonFormField(
              value: selectedGovernorate,
              items: askEngineerCubit.governmentList.map((governorate) {
                return DropdownMenuItem<String>(
                  value: governorate.id.toString(),
                  child: Text(
                    governorate.name ?? '',
                    style: AppStyles.font16BlackLight,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedGovernorate = value;
                  selectedCity = null;
                  signUpCubit.getCities(int.parse(value!));
                  askEngineerCubit.selectedGovernorate = value;
                });
              },
              labelText: AppLocale.theGovernorate.getString(context),
              validator: (value) {
                if (value == null) {
                  return AppLocale.pleaseSelectGovernorate.getString(context);
                }
                return null;
              },
            ),
            verticalSpace(16),
            AppCustomDropDownButtonFormField(
              value: selectedCity,
              items: selectedGovernorate != null
                  ? signUpCubit.cities
                      .map((city) {
                        return DropdownMenuItem<String>(
                          value: city.id.toString(),
                          child: Text(
                            city.name,
                            style: AppStyles.font16BlackLight,
                          ),
                        );
                      })
                      .toList()
                  : [],
              onChanged: (value) {
                setState(() {
                  selectedCity = value;
                  askEngineerCubit.selectedCity = value;
                });
              },
              labelText: AppLocale.theCity.getString(context),
              validator: (value) {
                if (value == null) {
                  return AppLocale.pleaseSelectCity.getString(context);
                }
                return null;
              },
            ),
            verticalSpace(16),
          ],
        );
      },
    );
  }
}
