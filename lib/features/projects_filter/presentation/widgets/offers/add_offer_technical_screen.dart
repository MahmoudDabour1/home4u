import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/features/projects_filter/logic/ask_technical/ask_technical_services_cubit.dart';
import 'package:home4u/features/projects_filter/logic/ask_technical/ask_technical_services_state.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../data/models/add_request/ask_technical/add_ask_technical_request_body.dart';
import '../generic_add_offer_screen.dart';

class AddOfferTechnicalScreen extends StatelessWidget {
  final int askId;

  const AddOfferTechnicalScreen({super.key, required this.askId});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AskTechnicalServicesCubit>();

    return GenericAddOfferScreen<AskTechnicalServicesCubit,
        AskTechnicalServicesState>(
      screenTitle: AppLocale.addOffer.getString(context),
      formKey: cubit.askTechnicalFormKey,
      commentController: cubit.commentController,
      onSubmit: () {
        cubit.requestAskTechnical(
          askTechnicalRequestBody: AddAskTechnicalRequestBody(
            askWorker: AskWorker(id: askId),
            comment: cubit.commentController.text,
          ),
        );
      },
      isLoading: (state) => state is RequestAskTechnicalLoading,
      isSuccess: (state) => state is RequestAskTechnicalSuccess,
      isFailure: (state) => state is RequestAskTechnicalFailure,
      errorExtractor: (state) =>
          (state is RequestAskTechnicalFailure) ? state.error : '',
    );
  }
}
