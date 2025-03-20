import 'package:flutter/material.dart';
import 'package:home4u/features/profile/presentation/widgets/services_widget/services_delete_alert_dialog.dart';

import '../../../../../core/theming/app_styles.dart';

class ServicesListViewItem extends StatelessWidget {
  final String serviceName;
  final int id;
  final int serviceId;
  final int userId;

  const ServicesListViewItem({
    super.key,
    required this.serviceName,
    required this.id,
    required this.serviceId,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
      title: Text(
        serviceName,
        style: AppStyles.font16BlackLight,
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_outline),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => ServicesDeleteAlertDialog(
              id: id,
              serviceId: serviceId,
              userId: userId,
            ),
          );
        },
      ),
    );
  }
}
