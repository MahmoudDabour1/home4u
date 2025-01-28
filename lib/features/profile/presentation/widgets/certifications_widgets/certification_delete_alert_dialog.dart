import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/widgets/app_custom_alert_dialog.dart';
import 'package:home4u/features/profile/logic/certifications/certifications_cubit.dart';

import '../../../../../core/helpers/helper_methods.dart';
import '../../../../../locale/app_locale.dart';
import '../../../logic/certifications/certifications_state.dart';

class CertificationDeleteAlertDialog extends StatelessWidget {
  final int certificationId;

  const CertificationDeleteAlertDialog(
      {super.key, required this.certificationId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CertificationsCubit, CertificationsState>(
      builder: (context, state) {
        final certificationCubit = context.read<CertificationsCubit>();
        return AppCustomAlertDialog(
          onDeleteButtonPressed: () async {
            final navigationBack = context.pop();
            await certificationCubit.deleteCertification(certificationId).then(
                (value) =>navigationBack,
            );
            certificationCubit.getAllCertifications();
            await showToast(
              message: AppLocale.deletedSuccessfully.getString(context),
            );
          },
          isLoading: state is DeleteCertificationLoading,
        );
      },
    );
  }
}
