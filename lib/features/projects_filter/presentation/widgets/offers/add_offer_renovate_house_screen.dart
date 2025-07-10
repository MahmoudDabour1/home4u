import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/features/projects_filter/logic/renovate_house/renovate_house_services_cubit.dart';
import 'package:home4u/features/projects_filter/logic/renovate_house/renovate_house_services_state.dart';

import '../../../../../locale/app_locale.dart';
import '../../../data/models/add_request/renovate_house/add_renovate_house_request_body.dart';
import '../generic_add_offer_screen.dart';

class AddOfferRenovateHouseScreen extends StatelessWidget {
  final int askId;
  const AddOfferRenovateHouseScreen( {super.key,required this.askId,});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RenovateHouseServicesCubit>();

    return GenericAddOfferScreen<RenovateHouseServicesCubit,
        RenovateHouseServicesState>(
      screenTitle: AppLocale.addOffer.getString(context),
      formKey: cubit.renovateHouseFormKey,
      commentController: cubit.commentController,
      onSubmit: () {
        cubit.requestRenovateHouse(
          renovateHouseRequestBody: AddRenovateHouseRequestBody(
            homeRenovate: HomeRenovate(id: askId),
            comment: cubit.commentController.text,
          ),
        );
      },
      isLoading: (state) => state is RenovateHouseServiceRequestLoading,
      isSuccess: (state) => state is RenovateHouseServiceRequestSuccess,
      isFailure: (state) => state is RenovateHouseServiceRequestFailure,
      errorExtractor: (state) =>
      (state is RenovateHouseServiceRequestFailure) ? state.error : '',
    );
  }
}
