import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/projects_filter/logic/asks/asks_cubit.dart';
import 'package:home4u/features/projects_filter/logic/asks/asks_state.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/ask_technical_worker_widgets/technical_ask_item.dart';

class AskTechnicalProjectDetailsAsksBlocBuilder extends StatelessWidget {
  const AskTechnicalProjectDetailsAsksBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AsksCubit, AsksState>(
      builder: (context, state) {
        return state.maybeWhen(
          technicalAsksSuccess: (technicalAsk) {
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
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }
}
