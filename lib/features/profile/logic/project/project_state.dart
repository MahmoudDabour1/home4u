import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/projects/get_projects_response_model.dart';

part 'project_state.freezed.dart';

@freezed
class ProjectState<T> with _$ProjectState<T> {
  const factory ProjectState.initial() = _Initial;

  const factory ProjectState.loading() = ProjectLoadingState;

  const factory ProjectState.success(T data) = ProjectSuccessState<T>;

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
  //addProject
  const factory ProjectState.addProjectLoading() = AddProjectLoading;
  const factory ProjectState.addProjectSuccess() = AddProjectSuccess;
  const factory ProjectState.addProjectError({required String error}) = AddProjectError;

//addImage
  const factory ProjectState.addImage() = AddImage;
  const factory ProjectState.addCover() = AddCover;


}
