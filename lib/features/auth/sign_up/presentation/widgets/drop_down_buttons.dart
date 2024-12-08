import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/auth/sign_up/data/models/sign_up_body.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_state.dart';

import '../../../../../core/theming/app_strings.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../../data/models/user_type_model.dart';

class DropDownButtons extends StatefulWidget {
  const DropDownButtons({super.key});

  @override
  State<DropDownButtons> createState() => _DropDownButtonsState();
}

class _DropDownButtonsState extends State<DropDownButtons> {
  String? selectedAccountType;
  String? selectedGovernorate;
  String? selectedCity;

  @override
  void initState() {
    super.initState();
    context.read<SignUpCubit>().getUserTypes();
    context.read<SignUpCubit>().getGovernorates();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        final cubit = context.read<SignUpCubit>();

        return Column(
          children: [
            verticalSpace(16),
            AppCustomDropDownButtonFormField(
              value: selectedAccountType,
              items: cubit.userTypes.map((userType) {
                return DropdownMenuItem<String>(
                  value: userType.code,
                  child: Text(
                    userType.name,
                    style: AppStyles.font16BlackLight,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedAccountType = value;
                  cubit.selectedUserType = cubit.userTypes
                      .firstWhere((userType) => userType.code == value)
                      .toUserTypeRequest();
                });
              },
              labelText: AppStrings.chooseYourAccountType,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select an account type';
                }
                return null;
              },
            ),
            verticalSpace(16),
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
                  cubit.getCities(int.parse(value!));
                });
              },
              labelText: AppStrings.theGovernorate,
            ),
            verticalSpace(16),
            AppCustomDropDownButtonFormField(
              value: selectedCity,
              items: selectedGovernorate != null
                  ? cubit.cities.map((city) {
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
                });
              },
              labelText: AppStrings.theCity,
            ),
            verticalSpace(16),
          ],
        );
      },
    );
  }
}

extension UserTypeDataExtension on UserTypeData {
  UserTypeRequest toUserTypeRequest() {
    return UserTypeRequest(id: id, code: code);
  }
}
