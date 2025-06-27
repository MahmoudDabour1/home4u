import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/projects_filter/logic/projects_filter_cubit.dart';
import 'package:home4u/features/projects_filter/logic/projects_filter_state.dart';

import '../furnish_house_widgets/furnish_house_tab_view_item.dart';

class FurnishHouseTabViewBody extends StatefulWidget {
  const FurnishHouseTabViewBody({super.key});

  @override
  State<FurnishHouseTabViewBody> createState() =>
      _FurnishHouseTabViewBodyState();
}

class _FurnishHouseTabViewBodyState extends State<FurnishHouseTabViewBody> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
    _scrollController = ScrollController()
      ..addListener(_scrollListener);
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
              ));
        }

        return ListView.separated(
          controller: _scrollController,
          itemCount: cubit.customPackages.length + (isLoadingMore ? 1 : 0),
          separatorBuilder: (_, __) => verticalSpace(12),
          itemBuilder: (context, index) {
            if (index < cubit.customPackages.length) {
              return FurnishHouseTabViewItem(
                renovateItem: cubit.customPackages[index],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }
}
