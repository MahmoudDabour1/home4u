import 'package:flutter/material.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/features/profile/presentation/widgets/certifications_widgets/certification_delete_alert_dialog.dart';

import '../../../../../core/routing/routes.dart';
import '../../../data/models/certifications/get_certifications_response_model.dart';
import 'certification_custom_menu_and_dialog.dart';

class CertificationMenuAndDialog extends StatelessWidget {
  final CertificationsData certificationData;

  const CertificationMenuAndDialog(
      {super.key, required this.certificationData});

  @override
  Widget build(BuildContext context) {
    return CertificationCustomMenuAndDialog(
      deleteWidget: CertificationDeleteAlertDialog(
        certificationId: certificationData.id!,
      ),
      onEdit: () {
        context.pushNamed(
          Routes.addCertificationScreen,
          arguments: certificationData,
        );
      },
    );
  }
}
