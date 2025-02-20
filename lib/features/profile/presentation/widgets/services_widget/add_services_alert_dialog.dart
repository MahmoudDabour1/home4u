import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:hive/hive.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/features/auth/sign_up/logic/technical_worker/technical_worker_cubit.dart';
import 'package:home4u/features/profile/logic/services/services_state.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/helpers/shared_pref_keys.dart';
import '../../../../../core/routing/router_observer.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_drop_down_multi_select_button.dart';
import '../../../../auth/sign_up/logic/engineer/engineer_cubit.dart';
import '../../../../auth/sign_up/logic/engineer/engineer_state.dart';
import '../../../data/models/profile/engineer_profile_response_model.dart';
import '../../../data/models/profile/technical_worker_profile_response_model.dart';
import '../../../data/models/services/update_service_body.dart';
import '../../../logic/services/services_cubit.dart';
import '../profile_widgets/delete_dialog_button_widget.dart';

class AddServicesAlertDialog extends StatefulWidget {
  const AddServicesAlertDialog({
    super.key,
  });

  @override
  State<AddServicesAlertDialog> createState() => _AddServicesAlertDialogState();
}

class _AddServicesAlertDialogState extends State<AddServicesAlertDialog> {
  List<String>? _selectedServiceName;
  late int userId;
  late int id;
  late int engineerTypeId;
  late int technicalWorkerTypeId;
  bool? isEngineer;

  @override
  void initState() {
    super.initState();
    _loadUserType();
  }

  void _loadUserType() async {
    final userType = await SharedPrefHelper.getString(SharedPrefKeys.userType);
    setState(() {
      isEngineer = userType == "ENGINEER";
      _initializeProfileData();
    });
  }

  Future<void> _initializeProfileData() async {
    var engineerBox =
        await Hive.openBox<EngineerProfileResponseModel>(kEngineerProfileBox);
    var engineerProfileData = engineerBox.get(kEngineerProfileData);
    var technicalWorkerBox = await Hive.openBox<TechnicalWorkerResponseModel>(
        kTechnicalWorkerProfileBox);
    var technicalWorkerProfileData =
        technicalWorkerBox.get(kTechnicalWorkerProfileData);

    if (isEngineer == true) {
      userId = engineerProfileData?.data?.user?.id ?? 0;
      id = engineerProfileData?.data?.id ?? 0;
      engineerTypeId = engineerProfileData?.data?.type?.id ?? 0;
      _selectedServiceName =
          engineerProfileData?.data?.engineerServ?.map((service) {
        return service.name ?? 'N/A';
      }).toList();
      context.read<EngineerCubit>().getEngineerServices(engineerTypeId);

      logger.i(
          "Engineer Services: $_selectedServiceName ,Engineer TypeId  $engineerTypeId\t  , User Id: $userId\t\t, Id: $id");
    } else {
      userId = technicalWorkerProfileData?.data?.user?.id ?? 0;
      id = technicalWorkerProfileData?.data?.id ?? 0;
      technicalWorkerTypeId = technicalWorkerProfileData?.data?.type?.id ?? 0;
      _selectedServiceName =
          technicalWorkerProfileData?.data?.workerServs?.map((service) {
        return service.name ?? 'N/A';
      }).toList();

      context.read<TechnicalWorkerCubit>().getTechnicalWorkerServices(
            technicalWorkerTypeId,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final servicesCubit = context.read<ServicesCubit>();

    if (isEngineer == null) {
      return Center(child: CircularProgressIndicator());
    }

    return AlertDialog(
      backgroundColor: AppColors.whiteColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalSpace(20),
          Text(
            AppLocale.addServices.getString(context),
            style: AppStyles.font16BlackMedium,
            textAlign: TextAlign.center,
          ),
          verticalSpace(32),
          isEngineer == true
              ? BlocBuilder<EngineerCubit, EngineerState>(
                  builder: (context, state) {
                    final engineerCubit = context.read<EngineerCubit>();
                    return AppCustomDropDownMultiSelectButton(
                      isEnabled: engineerCubit.engineerServices.isNotEmpty,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Please select at least one service";
                        }
                        return null;
                      },
                      selectedValues: _selectedServiceName ?? [],
                      items:
                          engineerCubit.engineerServices.map((engineerService) {
                        return engineerService.name ?? 'N/A';
                      }).toList(),
                      labelText:
                          AppLocale.engineeringServices.getString(context),
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
                )
              : BlocBuilder<TechnicalWorkerCubit, TechnicalWorkerState>(
                  builder: (context, state) {
                    final technicalWorkerCubit =
                        context.read<TechnicalWorkerCubit>();
                    return AppCustomDropDownMultiSelectButton(
                      isEnabled: technicalWorkerCubit
                          .technicalWorkerServices.isNotEmpty,
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
                      labelText:
                          AppLocale.technicalWorkerServices.getString(context),
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
                ),
        ],
      ),
      actions: [
        Row(
          children: [
            BlocBuilder<ServicesCubit, ServicesState>(
              builder: (context, state) {
                return DeleteDialogButtonWidget(
                  text: AppLocale.add.getString(context),
                  onPressed: () async {
                    if (servicesCubit.selectedServices == null ||
                        servicesCubit.selectedServices!.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please select at least one service"),
                        ),
                      );
                      return;
                    }
                    context.pop();
                    await context.read<ServicesCubit>().updateServices(
                          serviceIds: servicesCubit.selectedServices!
                              .map((id) => UpdateServiceBody(id: id))
                              .toList(),
                          userId: userId,
                          id: id,
                        );
                  },
                  backgroundColor: AppColors.secondaryGradientColor,
                );
              },
            ),
            horizontalSpace(16),
            DeleteDialogButtonWidget(
              isBoarder: true,
              backgroundColor: AppColors.whiteColor,
              textColor: AppColors.secondaryColor,
              text: AppLocale.cancel.getString(context),
              onPressed: () {
                context.pop();
              },
            ),
          ],
        ),
      ],
    );
  }
}
