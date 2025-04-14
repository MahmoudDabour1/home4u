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
import '../../../data/models/profile/engineering_office_profile_response_model.dart';
import '../../../data/models/profile/technical_worker_profile_response_model.dart';
import '../../../data/models/services/update_service_body.dart';
import '../../../logic/services/services_cubit.dart';
import '../profile_widgets/delete_dialog_button_widget.dart';
import 'engineer_services_dropdown_button.dart';
import 'engineering_office_drop_down_button.dart';

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
  late String userType;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeProfileData();
  }

  Future<void> _initializeProfileData() async {
    var engineerBox =
        await Hive.openBox<EngineerProfileResponseModel>(kEngineerProfileBox);
    var engineerProfileData = engineerBox.get(kEngineerProfileData);
    var technicalWorkerBox = await Hive.openBox<TechnicalWorkerResponseModel>(
        kTechnicalWorkerProfileBox);
    var technicalWorkerProfileData =
        technicalWorkerBox.get(kTechnicalWorkerProfileData);
    var engineeringOfficeBox =
        await Hive.openBox<EngineeringOfficeProfileResponseModel>(
            kEngineeringOfficeProfileBox);
    var engineeringOfficeProfileData =
        engineeringOfficeBox.get(kEngineeringOfficeProfileData);

    userType = await SharedPrefHelper.getString(SharedPrefKeys.userType);

    switch (userType) {
      case "ENGINEER":
        id = engineerProfileData?.data?.id ?? 0;
        userId = engineerProfileData?.data?.user?.id ?? 0;
        break;
      case "ENGINEERING_OFFICE":
        id = engineeringOfficeProfileData?.data?.id ?? 0;
        userId = engineeringOfficeProfileData?.data?.user?.id ?? 0;
        break;
      case "TECHNICAL_WORKER":
        id = technicalWorkerProfileData?.data?.id ?? 0;
        userId = technicalWorkerProfileData?.data?.user?.id ?? 0;
        break;
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final servicesCubit = context.read<ServicesCubit>();
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
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
          _buildDropdownButton(),
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

  Widget _buildDropdownButton() {
    switch (userType) {
      case "ENGINEER":
        return const EngineerServicesDropdownButton();
      case "ENGINEERING_OFFICE":
        return const EngineeringOfficeServicesDropDownButton();
      case "TECHNICAL_WORKER":
        return const TechnicalWorkerServicesDropdownButton();
      default:
        return const SizedBox.shrink();
    }
  }
}
