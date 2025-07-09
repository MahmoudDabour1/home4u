import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/features/projects_filter/logic/request_design/request_design_services_cubit.dart';
import 'package:home4u/features/projects_filter/logic/request_design/request_design_services_state.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../data/models/add_request/request_design/add_request_design_request_body.dart';
import '../generic_add_offer_screen.dart';

class AddOfferRequestDesignScreen extends StatelessWidget {
  final int askId;

  const AddOfferRequestDesignScreen({super.key,required this.askId,});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RequestDesignServicesCubit>();

    return GenericAddOfferScreen<RequestDesignServicesCubit,
        RequestDesignServicesState>(
      screenTitle: AppLocale.addOffer.getString(context),
      formKey: cubit.requestDesignFormKey,
      commentController: cubit.commentController,
      onSubmit: () {
        cubit.requestAskRequestDesign(
          askRequestDesignRequestBody: AddRequestDesignRequestBody(
            requestDesignItem: RequestDesignItem(id: askId),
            comment: cubit.commentController.text,
          ),
        );
      },
      isLoading: (state) => state is RequestDesignServiceRequestLoading,
      isSuccess: (state) => state is RequestDesignServiceRequestSuccess,
      isFailure: (state) => state is RequestDesignServiceRequestFailure,
      errorExtractor: (state) =>
      (state is RequestDesignServiceRequestFailure) ? state.error : '',
    );
  }
}
