import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/spacing.dart';
import '../../../logic/projects_filter/projects_filter_cubit.dart';
import '../../../logic/projects_filter/projects_filter_state.dart';
import '../renovate_house_custom_package/renovate_house_custom_package_tab_view_item.dart';

class RenovateHouseCustomPackageTabViewBody extends StatefulWidget {
  const RenovateHouseCustomPackageTabViewBody({super.key});

  @override
  State<RenovateHouseCustomPackageTabViewBody> createState() =>
      _RenovateHouseCustomPackageTabViewBodyState();
}

class _RenovateHouseCustomPackageTabViewBodyState
    extends State<RenovateHouseCustomPackageTabViewBody> {
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

    cubit.getFixedPackagesFilter(isRefresh: true);
  }

  void _scrollListener() {
    final cubit = context.read<ProjectsFilterCubit>();

    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent * 0.7 &&
        !cubit.hasReachedMaxOfFixedPackage) {
      cubit.getFixedPackagesFilter();
    }
  }

  @override
  void dispose() {
    final cubit = context.read<ProjectsFilterCubit>();
    cubit.resetPaginationOfFixedPackage();
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsFilterCubit, ProjectsFilterState>(
      builder: (context, state) {
        final cubit = context.read<ProjectsFilterCubit>();
        final isLoadingMore = cubit.isFetchingFixedPackage &&
            !cubit.hasReachedMaxOfFixedPackage;

        if (state is RenovateYourHouseFixedPackagesFilterLoading &&
            cubit.fixedPackages.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          );
        }

        return ListView.separated(
          itemBuilder: (context, index) {
            if (index < cubit.fixedPackages.length) {
              final package = cubit.fixedPackages[index];
              return RenovateHouseCustomPackageTabViewItem(
                renovateItem: package,
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
            }
            else {
              return const SizedBox.shrink();
            }
          },
          separatorBuilder: (_, __) => verticalSpace(12),
          itemCount: cubit.fixedPackages.length + (isLoadingMore ? 1 : 0),
        );
      },
    );
  }
}
