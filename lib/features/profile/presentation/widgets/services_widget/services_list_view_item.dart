import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/profile/presentation/widgets/services_widget/add_services_alert_dialog.dart';
import 'package:home4u/features/profile/presentation/widgets/services_widget/services_delete_alert_dialog.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_custom_drop_down_search_menu.dart';
import '../../../../auth/sign_up/data/models/services/freelancer_services.dart';

class ServicesListViewItem extends StatelessWidget {
  final String serviceName;
  final int engineerId;
  final int serviceId;
  final int userId;
  final FreelancerServiceData selectedService;
  final int engineerTypeId;

  const ServicesListViewItem({
    super.key,
    required this.serviceName,
    required this.engineerId,
    required this.serviceId,
    required this.selectedService,
    required this.userId,
    required this.engineerTypeId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            serviceName,
            style: AppStyles.font16BlackLight,
          ),
          AppCustomDropDownSearchMenu(
            onItemSelected: (value) {
              if (value == "delete") {
                showDialog(
                  context: context,
                  builder: (context) => ServicesDeleteAlertDialog(
                    engineerId: engineerId,
                    serviceId: serviceId,
                  ),
                );
              }
              if (value == "edit") {
                showDialog(
                  context: context,
                  builder: (context) {
                    return ServicesAlertDialog(
                      isEdit: true,
                      selectedService: selectedService,
                      userId: userId,
                      engineerTypeId: engineerTypeId,
                      engineerId: engineerId,
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
