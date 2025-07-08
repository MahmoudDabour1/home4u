import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/ask_engineer_widgets/ask_engineer_item.dart';

import '../../../../../core/utils/spacing.dart';
import '../../../logic/ask_engineer/ask_engineer_services_cubit.dart';
import '../../../logic/ask_engineer/ask_engineer_services_state.dart';

class AskEngineerServiceAsksDetails extends StatelessWidget {
  const AskEngineerServiceAsksDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AskEngineerServicesCubit, AskEngineerServicesState>(
      buildWhen:  (previous, current) => current.maybeWhen(
        askEngineerRequestsLoading: () => true,
        askEngineerRequestsSuccess: (_) => true,
        askEngineerRequestsFailure: (_) => true,
        orElse: () => false,
      ),
      builder: (context, state) {
        return state.maybeWhen(
          askEngineerRequestsLoading: () => SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          askEngineerRequestsSuccess: (engineerAsks) {
            final ask = engineerAsks.data;

            if (ask == null || ask.isEmpty) {
              return const SizedBox.shrink();
            }

            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return AskEngineerItem(ask: ask[index]);
              },
              separatorBuilder: (_, __) => verticalSpace(16),
              itemCount: ask.length,
            );
          },
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }
}
