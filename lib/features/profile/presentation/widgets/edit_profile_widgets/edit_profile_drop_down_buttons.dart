import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_state.dart';
import 'package:home4u/features/profile/logic/profile/profile_cubit.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../../../../../locale/app_locale.dart';
import '../../../../auth/sign_up/logic/sign_up_cubit.dart';

class EditProfileDropDownButtons extends StatefulWidget {
  const EditProfileDropDownButtons({super.key});

  @override
  State<EditProfileDropDownButtons> createState() =>
      _EditProfileDropDownButtonsState();
}

class _EditProfileDropDownButtonsState
    extends State<EditProfileDropDownButtons> {
  String? selectedAccountType;
  String? selectedGovernorate;
  String? selectedCity;

  @override
  void initState() {
    super.initState();
    context.read<SignUpCubit>().getGovernorates();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        final cubit = context.read<SignUpCubit>();
        final profileCubit = context.read<ProfileCubit>();
        return Column(
          children: [
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
                  profileCubit.selectedGovernorate = value;
                });
              },
              labelText: AppLocale.theGovernorate.getString(context),
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
                  profileCubit.selectedCity = value;
                });
              },
              labelText: AppLocale.theCity.getString(context),
            ),
          ],
        );
      },
    );
  }
}
