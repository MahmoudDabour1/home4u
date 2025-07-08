import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/ask_technical_worker_widgets/technical_ask_item.dart';

import '../../../logic/ask_technical/ask_technical_services_cubit.dart';
import '../../../logic/ask_technical/ask_technical_services_state.dart';

class AskTechnicalProjectDetailsAsksBlocBuilder extends StatelessWidget {
  const AskTechnicalProjectDetailsAsksBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AskTechnicalServicesCubit, AskTechnicalServicesState>(
      buildWhen: (previous, current) => current.maybeWhen(
        askTechnicalRequestsLoading: () => true,
        askTechnicalRequestsSuccess: (_) => true,
        askTechnicalRequestsFailure: (_) => true,
        orElse: () => false,
      ),
      builder: (context, state) {
        return state.maybeWhen(
          askTechnicalRequestsSuccess: (technicalAsk) {
            final ask = technicalAsk.data;

            if (ask == null || ask.isEmpty) {
              return const SizedBox.shrink();
            }

            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return TechnicalAskItem(ask: ask[index]);
              },
              separatorBuilder: (_, __) => verticalSpace(16),
              itemCount: ask.length,
            );
          },
          askTechnicalRequestsLoading: () => SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }
}
