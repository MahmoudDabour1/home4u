import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_state.freezed.dart';

@freezed
class ProjectState<T> with _$ProjectState<T> {
  const factory ProjectState.initial() = _Initial;



  ///get Project
  const factory ProjectState.getProjectLoading() = GetProjectLoading;

  const factory ProjectState.getProjectSuccess(T projectData) =
      GetProjectSuccess;

  const factory ProjectState.getProjectError({required String error}) =
      GetProjectError;



  /// Update Project
  const factory ProjectState.updateProjectLoading() = UpdateProjectLoading;

  const factory ProjectState.updateProjectSuccess() = UpdateProjectSuccess;

  const factory ProjectState.updateProjectError({required String error}) =
      UpdateProjectError;

  const factory ProjectState.failure({required String errorMessage}) =
      ProjectFailureState;

  //getProjects
  const factory ProjectState.getProjectsLoading() = GetProjectsLoading;
  const factory ProjectState.getProjectsSuccess(
      List<ProjectsData?>? projectData) = GetProjectsSuccess;
  const factory ProjectState.getProjectsError({required String error}) =
  GetProjectsError;

//deleteProject
  const factory ProjectState.deleteProjectLoading() = DeleteProjectLoading;
  const factory ProjectState.deleteProjectSuccess() = DeleteProjectSuccess;
  const factory ProjectState.deleteProjectError({required String error}) =
  DeleteProjectError;
  /// Add Project
  const factory ProjectState.addProjectLoading() = AddProjectLoading;

  const factory ProjectState.addProjectSuccess() = AddProjectSuccess;

  const factory ProjectState.addProjectError({required String error}) =
      AddProjectError;
}
