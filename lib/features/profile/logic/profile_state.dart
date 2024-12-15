import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/profile/data/models/get_projects_response_model.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState<T> with _$ProfileState<T> {
  const factory ProfileState.initial() = ProfileInitial;

//getProjects
  const factory ProfileState.getProjectsLoading() = GetProjectsLoading;
  const factory ProfileState.getProjectsSuccess(
      List<ProjectsData?>? projectData) = GetProjectsSuccess;
  const factory ProfileState.getProjectsError({required String error}) =
      GetProjectsError;

//deleteProject
  const factory ProfileState.deleteProjectLoading() = DeleteProjectLoading;
  const factory ProfileState.deleteProjectSuccess() = DeleteProjectSuccess;
  const factory ProfileState.deleteProjectError({required String error}) =
      DeleteProjectError;
}
