import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/auth/sign_up/logic/engineer/engineer_cubit.dart';
import 'package:home4u/features/auth/sign_up/logic/engineer/engineer_state.dart';
import '../../../../../../core/theming/app_strings.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../../../../../../core/widgets/app_custom_drop_down_multi_select_button.dart';
import '../egypt_locations_list.dart';

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
        final cubit = context.read<EngineerCubit>();
        return Column(
          children: [
            AppCustomDropDownButtonFormField(
              value: selectedEngineerType,
              items: cubit.engineerTypes.map((engineerType) {
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
                  selectedEngineerServices = null;
                  cubit.getEngineerServices(int.parse(value!));
                });
              },
              labelText: AppStrings.engineerType,
            ),
            verticalSpace(16),
            AppCustomDropDownMultiSelectButton(
              selectedValues: selectedEngineerServices ?? [],
              items: cubit.engineerServices.map((engineerService) {
                return engineerService.name ?? 'N/A';
              }).toList(),
              labelText: AppStrings.engineeringServices,
              onChanged: (List<String> values) {
                setState(() {
                  selectedEngineerServices = values;
                });
              },
            ),
          ],
        );
      },
    );
  }
}
