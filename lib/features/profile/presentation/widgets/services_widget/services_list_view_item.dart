import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/profile/presentation/widgets/services_widget/add_services_alert_dialog.dart';
import 'package:home4u/features/profile/presentation/widgets/services_widget/services_delete_alert_dialog.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_custom_drop_down_search_menu.dart';

class ServicesListViewItem extends StatelessWidget {
  final String serviceName;
  final int engineerId;
  final int serviceId;

  const ServicesListViewItem({
    super.key,
    required this.serviceName,
    required this.engineerId,
    required this.serviceId,
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
                  builder: (context) => ServicesAlertDialog(
                    isEdit: true,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
