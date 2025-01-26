import 'package:bloc/bloc.dart';
import 'package:home4u/features/profile/data/models/get_projects_response_model.dart';
import 'package:home4u/features/profile/logic/profile/profile_state.dart';

import '../../data/repos/projects_repo.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProjectsRepo _getProjectsRepo;

  ProfileCubit(this._getProjectsRepo) : super(const ProfileState.initial());
  List<ProjectsData?>? projectsList = [];

  void getProjects() async {
    emit(const ProfileState.getProjectsLoading());
    final response = await _getProjectsRepo.getProjects();
    response.when(
      success: (getProjectResponseModel) {
        projectsList = getProjectResponseModel.data ?? [];
        emit(ProfileState.getProjectsSuccess(projectsList));
      },
      failure: (error) {
        emit(ProfileState.getProjectsError(error: error.message.toString()));
      },
    );
  }

  Future<void> deleteProject(int projectId) async {
    emit(const ProfileState.deleteProjectLoading());
    final response = await _getProjectsRepo.getProjectsByUserId(projectId);
    response.when(
      success: (deleteProjectResponseModel) {
        emit(const ProfileState.deleteProjectSuccess());
      },
      failure: (error) {
        emit(ProfileState.deleteProjectError(error: error.message.toString()));
      },
    );
  }
}
