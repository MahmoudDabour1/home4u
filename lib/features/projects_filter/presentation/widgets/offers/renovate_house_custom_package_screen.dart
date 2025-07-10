import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/features/projects_filter/logic/renovate_house_custom_package/renovate_house_custom_package_services_cubit.dart';
import 'package:home4u/features/projects_filter/logic/renovate_house_custom_package/renovate_house_custom_package_services_state.dart';

import '../../../../../locale/app_locale.dart';
import '../../../data/models/add_request/renovate_house_custom_package/add_renovate_house_custom_package_request_body.dart';
import '../generic_add_offer_screen.dart';

class RenovateHouseCustomPackageScreen extends StatelessWidget {
  final int askId;

  const RenovateHouseCustomPackageScreen({
    super.key,
    required this.askId,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RenovateHouseCustomPackageServicesCubit>();

    return GenericAddOfferScreen<RenovateHouseCustomPackageServicesCubit,
        RenovateHouseCustomPackageServicesState>(
      screenTitle: AppLocale.addOffer.getString(context),
      formKey: cubit.customPackageFormKey,
      commentController: cubit.commentController,
      onSubmit: () {
        cubit.requestRenovateHouseCustomPackage(
          addRenovateHouseCustomPackageRequestBody:
              AddRenovateHouseCustomPackageRequestBody(
            selectCustomPackage: SelectCustomPackage(id: askId),
            comment: cubit.commentController.text,
          ),
        );
      },
      isLoading: (state) =>
          state is RenovateHouseCustomPackageServiceRequestLoading,
      isSuccess: (state) =>
          state is RenovateHouseCustomPackageServiceRequestSuccess,
      isFailure: (state) =>
          state is RenovateHouseCustomPackageServiceRequestFailure,
      errorExtractor: (state) =>
          (state is RenovateHouseCustomPackageServiceRequestFailure)
              ? state.error
              : '',
    );
  }
}
