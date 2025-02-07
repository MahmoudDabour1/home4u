import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/helpers/helper_methods.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/features/profile/presentation/widgets/delete_dialog_button_widget.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../../../../auth/sign_up/data/models/services/freelancer_services.dart';
import '../../../../auth/sign_up/logic/engineer/engineer_cubit.dart';
import '../../../../auth/sign_up/logic/engineer/engineer_state.dart';
import '../../../data/models/services/update_service_body.dart';
import '../../../logic/services/services_cubit.dart';

class ServicesAlertDialog extends StatefulWidget {
  final bool isEdit;
  final FreelancerServiceData? selectedService;
  final int userId;
  final int engineerId;
  final int engineerTypeId;

  const ServicesAlertDialog({
    super.key,
    this.isEdit = false,
    this.selectedService,
    required this.userId,
    required this.engineerTypeId,
    required this.engineerId,
  });

  @override
  State<ServicesAlertDialog> createState() => _ServicesAlertDialogState();
}

class _ServicesAlertDialogState extends State<ServicesAlertDialog> {
  String? _selectedServiceName;

  @override
  void initState() {
    super.initState();
    _selectedServiceName = widget.selectedService?.name;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EngineerCubit>(
      create: (_) =>
          sl<EngineerCubit>()..getEngineerServices(widget.engineerTypeId),
      child: Builder(
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.whiteColor,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                verticalSpace(20),
                Text(
                  widget.isEdit
                      ? AppLocale.editService.getString(context)
                      : AppLocale.addService.getString(context),
                  style: AppStyles.font16BlackMedium,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(32),
                BlocBuilder<EngineerCubit, EngineerState>(
                  builder: (context, state) {
                    final engineerCubit = context.read<EngineerCubit>();
                    return AppCustomDropDownButtonFormField(
                      value: _selectedServiceName,
                      items: engineerCubit.engineerServices
                          .map((service) => DropdownMenuItem(
                                value: service.name,
                                child: Text(service.name ?? ""),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedServiceName = value;
                        });
                      },
                      onSaved: (value) {
                        _selectedServiceName = value;
                      },
                      labelText: AppLocale.engineerType.getString(context),
                    );
                  },
                )
              ],
            ),
            actions: [
              Row(
                children: [
                  DeleteDialogButtonWidget(
                    text: widget.isEdit
                        ? AppLocale.edit.getString(context)
                        : AppLocale.add.getString(context),
                    onPressed: () async {
                      context.pop();
                      await showToast(
                          message: widget.isEdit ? "Edited" : "Added");
                      if (widget.isEdit && widget.selectedService != null) {
                        final updatedServiceData = [
                          UpdateServiceBody(
                            id: widget.selectedService!.id,
                            name: _selectedServiceName!,
                          )
                        ];
                        await context.read<ServicesCubit>().updateServices(
                              servicesData: updatedServiceData,
                              userId: widget.userId,
                              engineerId: widget.engineerId,
                            );
                      }
                    },
                    backgroundColor: AppColors.secondaryGradientColor,
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
        },
      ),
    );
  }
}
