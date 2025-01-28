import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/get_projects_response_model.dart';

part 'project_state.freezed.dart';

@freezed
class ProjectState<T> with _$ProjectState<T> {
  const factory ProjectState.initial() = _Initial;

  /// Get Projects
  const factory ProjectState.getProjectsLoading() = GetProjectsLoading;

  const factory ProjectState.getProjectsSuccess(
      T projectData) = GetProjectsSuccess;

  const factory ProjectState.getProjectsError({required String error}) =
      GetProjectsError;

  ///get Project
  const factory ProjectState.getProjectLoading() = GetProjectLoading;

  const factory ProjectState.getProjectSuccess(T projectData) =
      GetProjectSuccess;

  const factory ProjectState.getProjectError({required String error}) =
      GetProjectError;

  /// Delete Project
  const factory ProjectState.deleteProjectLoading() = DeleteProjectLoading;

  const factory ProjectState.deleteProjectSuccess() = DeleteProjectSuccess;

  const factory ProjectState.deleteProjectError({required String error}) =
      DeleteProjectError;

  /// Update Project
  const factory ProjectState.updateProjectLoading() = UpdateProjectLoading;

  const factory ProjectState.updateProjectSuccess() = UpdateProjectSuccess;

  const factory ProjectState.updateProjectError({required String error}) =
      UpdateProjectError;

  /// Add Project
  const factory ProjectState.addProjectLoading() = AddProjectLoading;

  const factory ProjectState.addProjectSuccess() = AddProjectSuccess;

  const factory ProjectState.addProjectError({required String error}) =
      AddProjectError;
}
