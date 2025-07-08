import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/projects_filter/logic/renovate_house/renovate_house_services_cubit.dart';
import 'package:home4u/features/projects_filter/logic/renovate_house/renovate_house_services_state.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/renovate_house_widgets/renovate_house_request_item.dart';

import '../../../../../core/utils/spacing.dart';

class RenovateHouseServiceDetailsRequests extends StatelessWidget {
  const RenovateHouseServiceDetailsRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RenovateHouseServicesCubit,RenovateHouseServicesState>(
      builder:  (context, state) {
        return state.maybeWhen(
          renovateHouseServiceRequestsLoading: () => SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          renovateHouseServiceRequestsSuccess: (renovateHouseRequests) {
            final requests = renovateHouseRequests.data;
            if (requests == null || requests.isEmpty) {
              return const SizedBox.shrink();
            }

            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final request = requests[index];
                return RenovateHouseRequestItem(requestData: request);
              },
              separatorBuilder: (_, __) => verticalSpace(16),
              itemCount: requests.length,
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
