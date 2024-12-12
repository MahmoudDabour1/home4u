import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/auth/sign_up/logic/technical_worker/technical_worker_cubit.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_cubit.dart';

import '../../../../../../core/theming/app_strings.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../../../../../../core/widgets/app_custom_drop_down_multi_select_button.dart';

class TechnicalWorkerDropDownButtons extends StatefulWidget {
  const TechnicalWorkerDropDownButtons({super.key});

  @override
  State<TechnicalWorkerDropDownButtons> createState() =>
      _TechnicalWorkerDropDownButtonsState();
}

class _TechnicalWorkerDropDownButtonsState
    extends State<TechnicalWorkerDropDownButtons> {
  String? selectedTechnicalWorkerType;
  List<String>? selectedTechnicalWorkerServices;

  @override
  void initState() {
    super.initState();
    context.read<TechnicalWorkerCubit>().getTechnicalWorkerTypes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TechnicalWorkerCubit, TechnicalWorkerState>(
      builder: (context, state) {
        final technicalWorkerCubit = context.read<TechnicalWorkerCubit>();
        final signUpCubit = context.read<SignUpCubit>();
        return Column(
          children: [
            AppCustomDropDownButtonFormField(
              value: selectedTechnicalWorkerType,
              items: technicalWorkerCubit.technicalWorkerTypes
                  .map((technicalWorkerType) {
                return DropdownMenuItem<String>(
                  value: technicalWorkerType.id.toString(),
                  child: Text(
                    technicalWorkerType.name,
                    style: AppStyles.font16BlackLight,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedTechnicalWorkerType = value;
                  selectedTechnicalWorkerServices = null;
                  technicalWorkerCubit
                      .getTechnicalWorkerServices(int.parse(value!));
                  signUpCubit.selectedWorkerType = int.parse(value);
                });
              },
              onSaved: (value) {
                signUpCubit.selectedWorkerType = int.parse(value!);
              },
              labelText: AppStrings.technicalWorkerTypes,
            ),
            verticalSpace(16),
            AppCustomDropDownMultiSelectButton(
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "Please select at least one service";
                }
                return null;
              },
              selectedValues: selectedTechnicalWorkerServices ?? [],
              items: technicalWorkerCubit.technicalWorkerServices
                  .map((technicalWorkerService) {
                return technicalWorkerService.name ?? 'N/A';
              }).toList(),
              labelText: AppStrings.technicalWorkerServices,
              onChanged: (List<String> values) {
                setState(() {
                  selectedTechnicalWorkerServices = values;
                  signUpCubit.selectedWorkerServices = values.map((name) {
                    return technicalWorkerCubit.technicalWorkerServices
                        .firstWhere((service) => service.name == name)
                        .id;
                  }).toList();
                });
              },
              onSaved: (value) {
                signUpCubit.selectedWorkerServices = value?.map((name) {
                  return technicalWorkerCubit.technicalWorkerServices
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
