import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:hive/hive.dart';

import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/widgets/app_custom_drop_down_multi_select_button.dart';
import '../../../../../locale/app_locale.dart';
import '../../../../auth/sign_up/logic/technical_worker/technical_worker_cubit.dart';
import '../../../data/models/profile/technical_worker_profile_response_model.dart';
import '../../../logic/services/services_cubit.dart';

class TechnicalWorkerServicesDropdownButton extends StatefulWidget {
  const TechnicalWorkerServicesDropdownButton({super.key});

  @override
  State<TechnicalWorkerServicesDropdownButton> createState() =>
      _TechnicalWorkerServicesDropdownButtonState();
}

class _TechnicalWorkerServicesDropdownButtonState
    extends State<TechnicalWorkerServicesDropdownButton> {
  List<String>? _selectedServiceName;
  late int technicalWorkerTypeId;

  @override
  void initState() {
    super.initState();
    _initializeProfileData();
  }

  Future<void> _initializeProfileData() async {
    var technicalWorkerBox = await Hive.openBox<TechnicalWorkerResponseModel>(
        kTechnicalWorkerProfileBox);
    var technicalWorkerProfileData =
        technicalWorkerBox.get(kTechnicalWorkerProfileData);

    technicalWorkerTypeId = technicalWorkerProfileData?.data?.type?.id ?? 0;
    _selectedServiceName =
        technicalWorkerProfileData?.data?.workerServs?.map((service) {
      return service.name ?? 'N/A';
    }).toList();

    context.read<TechnicalWorkerCubit>().getTechnicalWorkerServices(
          technicalWorkerTypeId,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TechnicalWorkerCubit, TechnicalWorkerState>(
      builder: (context, state) {
        final technicalWorkerCubit = context.read<TechnicalWorkerCubit>();
        final servicesCubit = context.read<ServicesCubit>();
        return AppCustomDropDownMultiSelectButton(
          isEnabled: technicalWorkerCubit.technicalWorkerServices.isNotEmpty,
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return "Please select at least one service";
            }
            return null;
          },
          selectedValues: _selectedServiceName ?? [],
          items: technicalWorkerCubit.technicalWorkerServices
              .map((engineerService) {
            return engineerService.name ?? 'N/A';
          }).toList(),
          labelText: AppLocale.technicalWorkerServices.getString(context),
          onChanged: (List<String> values) {
            setState(() {
              _selectedServiceName = values;
              servicesCubit.selectedServices = values.map((name) {
                return technicalWorkerCubit.technicalWorkerServices
                    .firstWhere((service) => service.name == name)
                    .id;
              }).toList();
            });
          },
          onSaved: (value) {
            servicesCubit.selectedServices = value?.map((name) {
              return technicalWorkerCubit.technicalWorkerServices
                  .firstWhere((service) => service.name == name)
                  .id;
            }).toList();
          },
        );
      },
    );
  }
}
