import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/profile/logic/profile_cubit.dart';
import 'package:home4u/features/profile/logic/profile_state.dart';
import 'package:home4u/features/profile/presentation/widgets/projects_widgets/projects_grid_view.dart';

class GetProjectsBlocBuilder extends StatelessWidget {
  const GetProjectsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
        buildWhen: (previous, current) =>
            current is GetProjectsSuccess ||
            current is GetProjectsLoading ||
            current is GetProjectsError,
        builder: (context, state) {
          return state.maybeWhen(
            initial: () => const CircularProgressIndicator(),
            getProjectsLoading: () => const CircularProgressIndicator(),
            getProjectsSuccess: (projects) {
              var projectsList = projects;
              return setupSuccessWidget(projectsList);
            },
            getProjectsError: (message) => Text(message),
            orElse: () {
              return const SizedBox.shrink();
            },
          );
        });
  }

  Widget setupSuccessWidget(projects) {
    return ProjectsGridView(projectsList: projects ?? []);
  }
}
