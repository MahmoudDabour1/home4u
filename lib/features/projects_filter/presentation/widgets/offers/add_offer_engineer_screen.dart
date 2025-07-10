import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/add_request/ask_engineer/add_ask_engineer_request_body.dart';
import '../../../logic/ask_engineer/ask_engineer_services_cubit.dart';
import '../../../logic/ask_engineer/ask_engineer_services_state.dart';
import '../generic_add_offer_screen.dart';

class AddOfferEngineerScreen extends StatelessWidget {
  final int askId;

  const AddOfferEngineerScreen({super.key, required this.askId});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AskEngineerServicesCubit>();

    return GenericAddOfferScreen<AskEngineerServicesCubit,
        AskEngineerServicesState>(
      screenTitle: "Add Offer",
      formKey: cubit.askEngineerFormKey,
      commentController: cubit.commentController,
      onSubmit: () {
        cubit.requestAskEngineer(
          askEngineerRequestBody: AddAskEngineerRequestBody(
            askEngineer: AskEngineer(id: askId),
            comment: cubit.commentController.text,
          ),
        );
      },
      isLoading: (state) => state is RequestAskEngineerLoading,
      isSuccess: (state) => state is RequestAskEngineerSuccess,
      isFailure: (state) => state is RequestAskEngineerFailure,
      errorExtractor: (state) =>
          (state is RequestAskEngineerFailure) ? state.error : '',
    );
  }
}
