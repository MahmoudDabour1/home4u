import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/ask_engineer_widgets/ask_engineer_tab_view_item.dart';

import '../../../../../core/utils/spacing.dart';
import '../../../logic/projects_filter/projects_filter_cubit.dart';
import '../../../logic/projects_filter/projects_filter_state.dart';

class AskEngineerTabViewBody extends StatefulWidget {
  const AskEngineerTabViewBody({super.key});

  @override
  State<AskEngineerTabViewBody> createState() => _AskEngineerTabViewBodyState();
}

class _AskEngineerTabViewBodyState extends State<AskEngineerTabViewBody> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  void _loadInitialData() {
    final cubit = context.read<ProjectsFilterCubit>();
    cubit.askEngineerFilter(isRefresh: true);
  }

  void _scrollListener() {
    final cubit = context.read<ProjectsFilterCubit>();

    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent * 0.7 &&
        !cubit.hasReachedMaxOfAskEngineer) {
      cubit.askEngineerFilter();
    }
  }

  @override
  void dispose() {
    final cubit = context.read<ProjectsFilterCubit>();
    cubit.resetPaginationOfAskEngineer();
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsFilterCubit, ProjectsFilterState>(
      builder: (context, state) {
        final cubit = context.read<ProjectsFilterCubit>();
        final isLoadingMore =
            cubit.isFetchingAskEngineer && !cubit.hasReachedMaxOfAskEngineer;

        if (state is AskEngineerFilterLoading &&
            cubit.askEngineerItems.isEmpty) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          );
        }

        return ListView.separated(
          itemBuilder: (context, index) {
            if (index < cubit.askEngineerItems.length) {
              return AskEngineerTabViewItem(
                askEngineer: cubit.askEngineerItems[index],
              );
            } else if (isLoadingMore) {
              return SizedBox(
                height: MediaQuery
                    .sizeOf(context)
                    .height * 0.4,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
          separatorBuilder: (_, __) => verticalSpace(12),
          itemCount: cubit.askEngineerItems.length + (isLoadingMore ? 1 : 0),
        );
      },
    );
  }
}
