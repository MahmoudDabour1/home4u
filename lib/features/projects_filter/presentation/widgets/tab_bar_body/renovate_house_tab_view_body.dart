import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/renovate_house_widgets/renovate_house_tab_view_item.dart';

import '../../../../../core/utils/spacing.dart';
import '../../../logic/projects_filter/projects_filter_cubit.dart';
import '../../../logic/projects_filter/projects_filter_state.dart';

class RenovateHouseTabViewBody extends StatefulWidget {
  const RenovateHouseTabViewBody({super.key});

  @override
  State<RenovateHouseTabViewBody> createState() =>
      _RenovateHouseTabViewBodyState();
}

class _RenovateHouseTabViewBodyState extends State<RenovateHouseTabViewBody> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  void _loadInitialData() {
    final cubit = context.read<ProjectsFilterCubit>();
    cubit.renovateHouseCustomPackages();
  }

  void _scrollListener() {
    final cubit = context.read<ProjectsFilterCubit>();

    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent * 0.7 &&
        !cubit.hasReachedMaxOfCustomPackage) {
      cubit.renovateHouseCustomPackages();
    }
  }

  @override
  void dispose() {
    final cubit = context.read<ProjectsFilterCubit>();
    cubit.resetPaginationOfCustomPackage();
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsFilterCubit, ProjectsFilterState>(
      builder: (context, state) {
        final cubit = context.read<ProjectsFilterCubit>();
        final isLoadingMore = cubit.isFetchingCustomPackage &&
            !cubit.hasReachedMaxOfCustomPackage;

        if (state is RenovateYourHouseCustomPackagesFilterLoading &&
            cubit.customPackages.isEmpty) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          );
        }
        return ListView.separated(
          itemBuilder: (context, index) {
            if (index < cubit.customPackages.length) {
              return RenovateHouseTabViewItem(
                renovateItem: cubit.customPackages[index],
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
          itemCount: cubit.customPackages.length + (isLoadingMore ? 1 : 0),
        );
      },
    );
  }
}
