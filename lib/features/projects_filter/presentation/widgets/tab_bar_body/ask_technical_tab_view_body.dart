import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/ask_technical_worker_widgets/ask_technical_tab_view_item.dart';

import '../../../../../core/utils/spacing.dart';
import '../../../logic/projects_filter/projects_filter_cubit.dart';
import '../../../logic/projects_filter/projects_filter_state.dart';

class AskTechnicalTabViewBody extends StatefulWidget {
  const AskTechnicalTabViewBody({super.key});

  @override
  State<AskTechnicalTabViewBody> createState() =>
      _AskTechnicalTabViewBodyState();
}

class _AskTechnicalTabViewBodyState extends State<AskTechnicalTabViewBody> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  void _loadInitialData() {
    final cubit = context.read<ProjectsFilterCubit>();
    cubit.askTechnicalWorkerFilter(isRefresh: true);
  }

  void _scrollListener() {
    final cubit = context.read<ProjectsFilterCubit>();

    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent * 0.7 &&
        !cubit.hasReachedMaxOfAskTechnicalWorker) {
      cubit.askTechnicalWorkerFilter();
    }
  }

  @override
  void dispose() {
    final cubit = context.read<ProjectsFilterCubit>();
    cubit.resetPaginationOfAskTechnical();
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsFilterCubit, ProjectsFilterState>(
      builder: (context, state) {
        final cubit = context.read<ProjectsFilterCubit>();
        final isLoadingMore = cubit.isFetchingAskTechnical &&
            !cubit.hasReachedMaxOfAskTechnicalWorker;

        if (state is AskTechnicalWorkerFilterLoading &&
            cubit.askTechnicalItems.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          );
        }

        return ListView.separated(
          itemBuilder: (context, index) {
            if (index < cubit.askTechnicalItems.length) {
              return AskTechnicalTabViewItem(
                askTechnical: cubit.askTechnicalItems[index],
              );
            } else if (isLoadingMore) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
          separatorBuilder: (_, __) => verticalSpace(12),
          itemCount: cubit.askTechnicalItems.length + (isLoadingMore ? 1 : 0),
        );
      },
    );
  }
}
