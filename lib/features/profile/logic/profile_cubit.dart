import 'package:bloc/bloc.dart';
import 'package:home4u/features/profile/data/models/get_projects_response_model.dart';
import 'package:home4u/features/profile/logic/profile_state.dart';

import '../data/repos/get_projects_repo.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProjectsRepo _getProjectsRepo;

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
}
