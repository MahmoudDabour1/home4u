import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/projects_filter/logic/request_design/request_design_services_cubit.dart';
import 'package:home4u/features/projects_filter/logic/request_design/request_design_services_state.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/request_design_widgets/request_design_request_item.dart';

class RequestDesignServiceDetailsRequests extends StatelessWidget {
  const RequestDesignServiceDetailsRequests({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestDesignServicesCubit, RequestDesignServicesState>(
      builder: (context, state) {
        return state.maybeWhen(
          requestDesignServiceRequestsLoading: () => SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          requestDesignServiceRequestsSuccess: (requestDesignRequests) {
            final requests = requestDesignRequests.data;
            if (requests == null || requests.isEmpty) {
              return const SizedBox.shrink();
            }

            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final request = requests[index];
                return RequestDesignRequestItem(
                  requestData: request,
                );
              },
              separatorBuilder: (_, __) => verticalSpace(16),
              itemCount: requests.length,
            );
          },
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }
}
