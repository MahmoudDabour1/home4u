import 'package:bloc/bloc.dart';
import 'package:home4u/features/profile/data/repos/projects_repo.dart';
import 'package:home4u/features/profile/logic/project/project_state.dart';

import '../../data/models/projects/get_projects_response_model.dart';

class ProjectCubit extends Cubit<ProjectState> {
  final ProjectsRepo _projectRepository;

  ProjectCubit(this._projectRepository) : super(ProjectState.initial());

  List<ProjectsData?>? projectsList = [];

  void getProjects() async {
    emit(const ProjectState.getProjectsLoading());
    final response = await _projectRepository.getProjects();
    response.when(
      success: (getProjectResponseModel) {
        projectsList = getProjectResponseModel.data ?? [];
        emit(ProjectState.getProjectsSuccess(projectsList));
      },
      failure: (error) {
        emit(ProjectState.getProjectsError(error: error.message.toString()));
      },
    );
  }

  Future<void> deleteProject(int projectId) async {
    emit(const ProjectState.deleteProjectLoading());
    final response = await _projectRepository.getProjectsByUserId(projectId);
    response.when(
      success: (deleteProjectResponseModel) {
        emit(const ProjectState.deleteProjectSuccess());
      },
      failure: (error) {
        emit(ProjectState.deleteProjectError(error: error.message.toString()));
      },
    );
  }
}
