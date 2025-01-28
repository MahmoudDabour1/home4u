import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:home4u/features/profile/data/repos/projects_repo.dart';
import 'package:home4u/features/profile/logic/project/project_state.dart';

import '../../../../core/networking/dio_factory.dart';
import '../../data/models/projects/get_projects_response_model.dart';
import '../../data/models/get_projects_response_model.dart';

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

  Future<void> addProject(FormData projectData) async {
    emit(ProjectState.loading());
  List<ProjectsData?>? projectsList = [];

  void getProjects() async {
    emit(const ProjectState.getProjectLoading());
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

  void getProject(int projectId) async {
    emit(const ProjectState.getProjectLoading());
    final response = await _projectRepository.getProjectsByUserId(projectId);
    response.when(
      success: (getProjectResponseModel) {
        emit(ProjectState.getProjectSuccess(getProjectResponseModel.data));
      },
      failure: (error) {
        emit(ProjectState.getProjectError(error: error.message.toString()));
      },
    );
  }

  Future<void> addProject(
    FormData projectData,
  ) async {
    emit(ProjectState.addProjectLoading());
    DioFactory.setContentType('multipart/form-data');

    final response = await _projectRepository.addProject(projectData);
    response.when(
      success: (projectResponse) {
        emit(ProjectState.addProjectSuccess());
      },
      failure: (error) {
        emit(ProjectState.addProjectError(error: error.message.toString()));
      },
    );
  }

  Future<void> updateProject(
    FormData projectData,
  ) async {
    emit(ProjectState.updateProjectLoading());
    DioFactory.setContentType('multipart/form-data');

    final response = await _projectRepository.updateProject(projectData);
    response.when(
      success: (projectResponse) {
        emit(ProjectState.updateProjectSuccess());
      },
      failure: (error) {
        emit(ProjectState.updateProjectError(error: error.message.toString()));
      },
    );
  }

  Future<void> deleteProject(
    int projectId,
  ) async {
    emit(ProjectState.deleteProjectLoading());
    final response = await _projectRepository.deleteProjectsByUserId(projectId);
    response.when(
      success: (deleteProjectResponseModel) {
        emit(ProjectState.deleteProjectSuccess());
      },
      failure: (error) {
        emit(ProjectState.deleteProjectError(error: error.message.toString()));
      },
    );
  }
}
