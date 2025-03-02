import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/routing/routes.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/widgets/app_custom_add_button.dart';
import '../../../../../locale/app_locale.dart';
import '../../../logic/project/project_cubit.dart';
import 'get_projects_bloc_builder.dart';

class ProjectsBody extends StatefulWidget {
  const ProjectsBody({super.key});

  @override
  State<ProjectsBody> createState() => _ProjectsBodyState();
}

class _ProjectsBodyState extends State<ProjectsBody> {
  final RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // await context.read<ProjectCubit>().getProjects();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await context.read<ProjectCubit>().getProjects();
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppCustomAddButton(
          text: AppLocale.addProject.getString(context),
          onPressed: () => context.pushNamed(Routes.addProjectScreen),
        ),
        Expanded(
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: false,
            header:
            ClassicHeader(),
            controller: _refreshController,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            child: GetProjectsBlocBuilder(),
          ),
        ),
      ],
    );
  }
}
