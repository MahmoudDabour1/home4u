import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/tab_bar_body/empty_state_widget.dart';

import '../../../../../core/utils/spacing.dart';
import '../../../logic/projects_filter/projects_filter_cubit.dart';
import '../../../logic/projects_filter/projects_filter_state.dart';
import '../request_design_widgets/request_design_tab_view_item.dart';

class RequestDesignTabViewBody extends StatefulWidget {
  const RequestDesignTabViewBody({super.key});

  @override
  State<RequestDesignTabViewBody> createState() =>
      _RequestDesignTabViewBodyState();
}

class _RequestDesignTabViewBodyState extends State<RequestDesignTabViewBody>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  void _loadInitialData() {
    final cubit = context.read<ProjectsFilterCubit>();
    cubit.getRequestDesignFilter(isRefresh: true);
  }

  void _scrollListener() {
    final cubit = context.read<ProjectsFilterCubit>();

    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent * 0.7 &&
        !cubit.hasReachedMaxOfRequestDesign) {
      cubit.getRequestDesignFilter();
    }
  }

  @override
  void dispose() {
    final cubit = context.read<ProjectsFilterCubit>();
    cubit.resetPaginationOfRequestDesign();
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<ProjectsFilterCubit, ProjectsFilterState>(
      builder: (context, state) {
        final cubit = context.read<ProjectsFilterCubit>();
        final isLoadingMore = cubit.isFetchingRequestDesign &&
            !cubit.hasReachedMaxOfRequestDesign;

        if (state is RequestDesignFilterLoading &&
            cubit.requestDesignItems.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          );
        }

        if (state is RequestDesignFilterSuccess &&
            cubit.requestDesignItems.isEmpty) {
          return const EmptyStateWidget(
            title: 'No request design items available.',
          );
        }

        return ListView.separated(
          controller: _scrollController,
          itemBuilder: (context, index) {
            if (index < cubit.requestDesignItems.length) {
              return RequestDesignTabViewItem(
                requestDesignItem: cubit.requestDesignItems[index],
              );
            } else if (isLoadingMore) {
              return SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.4,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
          separatorBuilder: (_, __) => verticalSpace(12),
          itemCount: cubit.requestDesignItems.length + (isLoadingMore ? 1 : 0),
        );
      },
    );
  }
}
