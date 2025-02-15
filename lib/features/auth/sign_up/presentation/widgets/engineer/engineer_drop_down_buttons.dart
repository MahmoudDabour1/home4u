import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/features/auth/sign_up/logic/engineer/engineer_cubit.dart';
import 'package:home4u/features/auth/sign_up/logic/engineer/engineer_state.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_cubit.dart';

import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../../../../../../core/widgets/app_custom_drop_down_multi_select_button.dart';
import '../../../../../../locale/app_locale.dart';

class EngineerDropDownButtons extends StatefulWidget {
  const EngineerDropDownButtons({super.key});

  @override
  State<EngineerDropDownButtons> createState() =>
      _EngineerDropDownButtonsState();
}

class _EngineerDropDownButtonsState extends State<EngineerDropDownButtons> {
  String? selectedEngineerType;
  List<String>? selectedEngineerServices;

  @override
  void initState() {
    super.initState();
    context.read<EngineerCubit>().getEngineerTypes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EngineerCubit, EngineerState>(
      builder: (context, state) {
        final engineerCubit = context.read<EngineerCubit>();
        final signUpCubit = context.read<SignUpCubit>();
        return Column(
          children: [
            AppCustomDropDownButtonFormField(
              value: selectedEngineerType,
              items: engineerCubit.engineerTypes.map((engineerType) {
                return DropdownMenuItem<String>(
                  value: engineerType.id.toString(),
                  child: Text(
                    engineerType.name,
                    style: AppStyles.font16BlackLight,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedEngineerType = value;
                  selectedEngineerServices = [];
                  signUpCubit.selectedEngineerServices = [];
                  engineerCubit.getEngineerServices(int.parse(value!));
                  signUpCubit.selectedEngineerType = int.parse(value);
                });
              },
              onSaved: (value) {
                signUpCubit.selectedEngineerType = int.parse(value!);
              },
              labelText: AppLocale.engineerType.getString(context),
            ),
            verticalSpace(16),
            AppCustomDropDownMultiSelectButton(
              isEnabled: engineerCubit.engineerTypes.isNotEmpty,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "Please select at least one service";
                }
                return null;
              },
              selectedValues: selectedEngineerServices ?? [],
              items: engineerCubit.engineerServices.map((engineerService) {
                return engineerService.name ?? 'N/A';
              }).toList(),
              labelText: AppLocale.engineeringServices.getString(context),
              onChanged: (List<String> values) {
                setState(() {
                  selectedEngineerServices = values;
                  signUpCubit.selectedEngineerServices = values.map((name) {
                    return engineerCubit.engineerServices
                        .firstWhere((service) => service.name == name)
                        .id;
                  }).toList();
                });
              },
              onSaved: (value) {
                signUpCubit.selectedEngineerServices = value?.map((name) {
                  return engineerCubit.engineerServices
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