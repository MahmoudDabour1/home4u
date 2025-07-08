import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/projects_filter/logic/renovate_house_custom_package/renovate_house_custom_package_services_cubit.dart';
import 'package:home4u/features/projects_filter/logic/renovate_house_custom_package/renovate_house_custom_package_services_state.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/renovate_house_custom_package/renovate_house_custom_package_request_item.dart';

import '../../../../../core/utils/spacing.dart';

class RenovateHouseCustomPackageServiceDetailsRequests extends StatelessWidget {
  const RenovateHouseCustomPackageServiceDetailsRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RenovateHouseCustomPackageServicesCubit,RenovateHouseCustomPackageServicesState>(
      buildWhen : (previous, current) {
        return current.maybeWhen(
          renovateHouseCustomPackageServiceRequestsLoading: () => true,
          renovateHouseCustomPackageServiceRequestsSuccess: (_) => true,
          renovateHouseCustomPackageServiceRequestsFailure: (_) => true,
          orElse: () => false,
        );
      },

      builder: (context, state) {
        return state.maybeWhen(
          renovateHouseCustomPackageServiceRequestsLoading: () => SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          renovateHouseCustomPackageServiceRequestsSuccess: (renovateHouseRequests) {
            final requests = renovateHouseRequests.data;
            if (requests == null || requests.isEmpty) {
              return const SizedBox.shrink();
            }

            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final request = requests[index];
                return RenovateHouseCustomPackageRequestItem(requestData: request);
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
