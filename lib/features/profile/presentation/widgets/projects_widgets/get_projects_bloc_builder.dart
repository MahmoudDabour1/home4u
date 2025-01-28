import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/profile/logic/project/project_cubit.dart';
import 'package:home4u/features/profile/logic/project/project_state.dart';
import 'package:home4u/features/profile/presentation/widgets/projects_widgets/projects_grid_view.dart';
import 'package:home4u/features/profile/presentation/widgets/projects_widgets/projects_grid_view_shimmer_widget.dart';


class GetProjectsBlocBuilder extends StatelessWidget {
  const GetProjectsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectCubit, ProjectState>(
        buildWhen: (previous, current) =>
            current is GetProjectsSuccess ||
            current is GetProjectsLoading ||
            current is GetProjectsError,
        builder: (context, state) {
          return state.maybeWhen(
            getProjectsLoading: () => ProjectsGridViewShimmerWidget (),
            getProjectsSuccess: (projects) {
              var projectsList = projects;
              return setupSuccessWidget(projectsList);
            },
            getProjectsError:(errorHandler)=>setupError(),
            orElse: () {
              return const SizedBox.shrink();
            },
          );
        });
  }

  Widget setupSuccessWidget(projects) {
    return ProjectsGridView(projectsList: projects ?? []);
  }
  Widget setupError() {
    return const SizedBox.shrink();
  }
}
