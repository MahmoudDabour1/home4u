import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:hive/hive.dart';

import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/widgets/app_custom_drop_down_multi_select_button.dart';
import '../../../../../locale/app_locale.dart';
import '../../../../auth/sign_up/logic/engineer/engineer_cubit.dart';
import '../../../../auth/sign_up/logic/engineer/engineer_state.dart';
import '../../../data/models/profile/engineer_profile_response_model.dart';
import '../../../logic/services/services_cubit.dart';

class EngineerServicesDropdownButton extends StatefulWidget {
  const EngineerServicesDropdownButton({super.key});

  @override
  State<EngineerServicesDropdownButton> createState() =>
      _EngineerServicesDropdownButtonState();
}

class _EngineerServicesDropdownButtonState
    extends State<EngineerServicesDropdownButton> {
  List<String>? _selectedServiceName;
  late int engineerTypeId;

  @override
  void initState() {
    super.initState();
    _initializeProfileData();
  }

  Future<void> _initializeProfileData() async {
    var engineerBox =
        await Hive.openBox<EngineerProfileResponseModel>(kEngineerProfileBox);
    var engineerProfileData = engineerBox.get(kEngineerProfileData);

    engineerTypeId = engineerProfileData?.data?.type?.id ?? 0;
    _selectedServiceName =
        engineerProfileData?.data?.engineerServ?.map((service) {
      return service.name ?? 'N/A';
    }).toList();
    context.read<EngineerCubit>().getEngineerServices(engineerTypeId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EngineerCubit, EngineerState>(
      builder: (context, state) {
        final engineerCubit = context.read<EngineerCubit>();
        final servicesCubit = context.read<ServicesCubit>();

        return AppCustomDropDownMultiSelectButton(
          isEnabled: engineerCubit.engineerServices.isNotEmpty,
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return "Please select at least one service";
            }
            return null;
          },
          selectedValues: _selectedServiceName ?? [],
          items: engineerCubit.engineerServices.map((engineerService) {
            return engineerService.name ?? 'N/A';
          }).toList(),
          labelText: AppLocale.engineeringServices.getString(context),
          onChanged: (List<String> values) {
            setState(() {
              _selectedServiceName = values;
              servicesCubit.selectedServices = values.map((name) {
                return engineerCubit.engineerServices
                    .firstWhere((service) => service.name == name)
                    .id;
              }).toList();
            });
          },
          onSaved: (value) {
            servicesCubit.selectedServices = value?.map((name) {
              return engineerCubit.engineerServices
                  .firstWhere((service) => service.name == name)
                  .id;
            }).toList();
          },
        );
      },
    );
  }
}
