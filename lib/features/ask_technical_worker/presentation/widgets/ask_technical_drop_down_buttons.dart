import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/features/ask_technical_worker/logic/ask_technical_cubit.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../../../../locale/app_locale.dart';
import '../../../auth/sign_up/logic/sign_up_cubit.dart';
import '../../../auth/sign_up/logic/sign_up_state.dart';
import '../../logic/ask_technical_state.dart';

class AskTechnicalDropDownButtons extends StatefulWidget {
  const AskTechnicalDropDownButtons({super.key});

  @override
  State<AskTechnicalDropDownButtons> createState() => _AskTechnicalDropDownButtonsState();
}

class _AskTechnicalDropDownButtonsState extends State<AskTechnicalDropDownButtons> {
  String? selectWorkerType;
  String? selectUnitType;
  String? selectedGovernorate;
  String? selectedCity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AskTechnicalCubit, AskTechnicalState>(
      builder: (context, state) {
        final askTechnicalCubit = context.read<AskTechnicalCubit>();
        final signUpCubit = context.read<SignUpCubit>();
        return Column(
          children: [
            verticalSpace(16),
            AppCustomDropDownButtonFormField(
              value: selectWorkerType,
              items: askTechnicalCubit.selectWorkerTypeList.map((workerType) {
                return DropdownMenuItem<String>(
                  value: workerType.id.toString(),
                  child: Text(
                    workerType.name ?? '',
                    style: AppStyles.font16BlackLight,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  askTechnicalCubit.selectWorkerType = value;
                });
              },
              labelText: AppLocale.workerTypeSelection.getString(context),
              validator: (value) {
                if (value == null) {
                  return AppLocale.pleaseSelectWorkerType.getString(
                      context);
                }
                return null;
              },
            ),
            verticalSpace(16),
            AppCustomDropDownButtonFormField(
              value: selectUnitType,
              items: askTechnicalCubit.selectUnitTypeList.map((unitType) {
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
                  askTechnicalCubit.selectUnitType = value;
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
              items: askTechnicalCubit.governmentList.map((governorate) {
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
                  askTechnicalCubit.selectedGovernorate = value;
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
            BlocBuilder<SignUpCubit, SignUpState>(
              builder: (context, state) {
                return AppCustomDropDownButtonFormField(
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
                      askTechnicalCubit.selectedCity = value;
                    });
                  },
                  labelText: AppLocale.theCity.getString(context),
                  validator: (value) {
                    if (value == null) {
                      return AppLocale.pleaseSelectCity.getString(context);
                    }
                    return null;
                  },
                );
              },
            ),
            verticalSpace(16),
          ],
        );
      },
    );
  }
}
