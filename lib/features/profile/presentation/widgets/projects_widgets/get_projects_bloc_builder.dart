import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/profile/logic/project/project_cubit.dart';
import 'package:home4u/features/profile/logic/project/project_state.dart';
import 'package:home4u/features/profile/presentation/widgets/projects_widgets/projects_grid_view.dart';
import 'package:home4u/features/profile/presentation/widgets/projects_widgets/projects_grid_view_shimmer_widget.dart';

class GetProjectsBlocBuilder extends StatefulWidget {
  const GetProjectsBlocBuilder({super.key});

  @override
  _GetProjectsBlocBuilderState createState() => _GetProjectsBlocBuilderState();
}

class _GetProjectsBlocBuilderState extends State<GetProjectsBlocBuilder>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<ProjectCubit, ProjectState>(
      buildWhen: (previous, current) {
        return current is GetProjectsSuccess ||
            current is GetProjectsLoading ||
            current is GetProjectsError ||
            current is AddProjectSuccess ||
            current is DeleteProjectSuccess ||
            current is UpdateProjectSuccess;
      },
      builder: (context, state) {
        return state.maybeWhen(
          getProjectsLoading: () => ProjectsGridViewShimmerWidget(),
          getProjectsSuccess: (projects) {
            var projectsList = projects;
            return setupSuccessWidget(projectsList);
          },
          getProjectsError: (errorHandler) => setupError(),
          addProjectSuccess: () {
            context.read<ProjectCubit>().getProjects();
            return ProjectsGridViewShimmerWidget();
          },
          deleteProjectSuccess: () {
            context.read<ProjectCubit>().getProjects();
            return ProjectsGridViewShimmerWidget();
          },
          updateProjectSuccess: () {
            context.read<ProjectCubit>().getProjects();
            return ProjectsGridViewShimmerWidget();
          },
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget setupSuccessWidget(projects) {
    return ProjectsGridView(projectsList: projects ?? []);
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
