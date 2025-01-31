import 'package:flutter/material.dart';
import 'package:home4u/features/profile/presentation/widgets/certifications_widgets/certification_delete_alert_dialog.dart';
import 'package:home4u/features/profile/presentation/widgets/profile_custom_menu_and_dialog.dart';

class CertificationMenuAndDialog extends StatelessWidget {
  final int certificationId;
  const CertificationMenuAndDialog({super.key, required this.certificationId});

  @override
  Widget build(BuildContext context) {
    return ProfileCustomMenuAndDialog(
      isCertifications: true,
      deleteWidget: CertificationDeleteAlertDialog(
        certificationId: certificationId,
      ),
    );
  }
}
