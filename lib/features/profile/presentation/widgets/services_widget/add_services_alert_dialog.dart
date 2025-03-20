import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:hive/hive.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/features/profile/logic/services/services_state.dart';
import 'package:home4u/features/profile/presentation/widgets/services_widget/technical_worker_services_dropdown_button.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/helpers/shared_pref_keys.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../data/models/profile/engineer_profile_response_model.dart';
import '../../../data/models/profile/technical_worker_profile_response_model.dart';
import '../../../data/models/services/update_service_body.dart';
import '../../../logic/services/services_cubit.dart';
import '../profile_widgets/delete_dialog_button_widget.dart';
import 'engineer_services_dropdown_button.dart';

class AddServicesAlertDialog extends StatefulWidget {
  const AddServicesAlertDialog({
    super.key,
  });

  @override
  State<AddServicesAlertDialog> createState() => _AddServicesAlertDialogState();
}

class _AddServicesAlertDialogState extends State<AddServicesAlertDialog> {
  late int userId;
  late int id;
  bool? isEngineer;

  @override
  void initState() {
    super.initState();
    _loadUserType();
  }

  void _loadUserType() async {
    final String userType =
        await SharedPrefHelper.getString(SharedPrefKeys.userType);
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
    } else {
      userId = technicalWorkerProfileData?.data?.user?.id ?? 0;
      id = technicalWorkerProfileData?.data?.id ?? 0;
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
              ? EngineerServicesDropdownButton()
              : TechnicalWorkerServicesDropdownButton(),
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
