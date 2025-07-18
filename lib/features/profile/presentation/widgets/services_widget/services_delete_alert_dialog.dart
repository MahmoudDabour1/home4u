import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/features/profile/logic/services/services_cubit.dart';
import 'package:home4u/features/profile/logic/services/services_state.dart';

import '../../../../../core/helpers/helper_methods.dart';
import '../../../../../core/widgets/app_custom_alert_dialog.dart';
import '../../../../../locale/app_locale.dart';

class ServicesDeleteAlertDialog extends StatelessWidget {
  final int id;
  final int serviceId;
  final int userId;

  const ServicesDeleteAlertDialog({
    super.key,
    required this.id,
    required this.serviceId,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesCubit, ServicesState>(
      builder: (context, state) {
        final serviceCubit = context.read<ServicesCubit>();
        return AppCustomAlertDialog(
          isLoading: false,
          onDeleteButtonPressed: () async {
            final navigationBack = context.pop();
            await serviceCubit.deleteService(
              id: id,
              serviceId: serviceId,
              userId: userId,
            );
            serviceCubit.getServices(id: id);
            navigationBack;
            await showToast(
              message: AppLocale.deletedSuccessfully.getString(context),
            );
          },
        );
      },
    );
  }
}
