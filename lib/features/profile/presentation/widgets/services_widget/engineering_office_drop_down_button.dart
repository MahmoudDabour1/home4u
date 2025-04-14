import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:hive/hive.dart';
import 'package:home4u/features/auth/sign_up/logic/engineering_office/engineering_office_cubit.dart';
import 'package:home4u/features/auth/sign_up/logic/engineering_office/engineering_office_state.dart';

import '../../../../../core/routing/router_observer.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/widgets/app_custom_drop_down_multi_select_button.dart';
import '../../../../../locale/app_locale.dart';
import '../../../data/models/profile/engineering_office_profile_response_model.dart';
import '../../../logic/services/services_cubit.dart';

class EngineeringOfficeServicesDropDownButton extends StatefulWidget {
  const EngineeringOfficeServicesDropDownButton({super.key});

  @override
  State<EngineeringOfficeServicesDropDownButton> createState() =>
      _EngineeringOfficeServicesDropDownButtonState();
}

class _EngineeringOfficeServicesDropDownButtonState
    extends State<EngineeringOfficeServicesDropDownButton> {
  late int engineeringOfficeFieldId;
  List<String>? selectedEngineeringOfficeDepartments;

  @override
  void initState() {
    super.initState();
    _initializeEngineeringOfficeDepartments();
  }

  void _initializeEngineeringOfficeDepartments() async {
    var engineeringOfficeBox =
        await Hive.openBox<EngineeringOfficeProfileResponseModel>(
            kEngineeringOfficeProfileBox);
    var engineeringOfficeProfileData =
        engineeringOfficeBox.get(kEngineeringOfficeProfileData);
    engineeringOfficeFieldId =
        engineeringOfficeProfileData?.data?.engineeringOfficeField?.id ?? 0;
    selectedEngineeringOfficeDepartments = engineeringOfficeProfileData
        ?.data?.engineeringOfficeDepartments
        ?.map((department) => department.name ?? "N/A")
        .toList();
    logger.i('Engineering Office Field ID: $engineeringOfficeFieldId');
    context
        .read<EngineeringOfficeCubit>()
        .getEngineeringOfficeServices(engineeringOfficeFieldId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EngineeringOfficeCubit, EngineeringOfficeState>(
      builder: (context, state) {
        final servicesCubit = context.read<ServicesCubit>();
        final engineeringOfficeCubit = context.read<EngineeringOfficeCubit>();

        return AppCustomDropDownMultiSelectButton(
          isEnabled: true,
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
          labelText: AppLocale.engineeringOfficeDepartments.getString(context),
          onChanged: (List<String> values) {
            setState(() {
              selectedEngineeringOfficeDepartments = values;
              servicesCubit.selectedServices = values.map((name) {
                return engineeringOfficeCubit.engineeringOfficeDepartments
                    .firstWhere((service) => service.name == name)
                    .id;
              }).toList();
            });
          },
          onSaved: (value) {
            servicesCubit.selectedServices = value?.map((name) {
              return engineeringOfficeCubit.engineeringOfficeDepartments
                  .firstWhere((service) => service.name == name)
                  .id;
            }).toList();
          },
        );
      },
    );
  }
}
