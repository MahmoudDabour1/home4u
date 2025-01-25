import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:home4u/features/profile/data/repos/projects_repo.dart';
import 'package:home4u/features/profile/logic/project/project_state.dart';

import '../../../../core/networking/dio_factory.dart';

class ProjectCubit extends Cubit<ProjectState> {
  final ProjectsRepo _projectRepository;

  ProjectCubit(this._projectRepository) : super(ProjectState.initial());

  Future<void> addProject(
    FormData projectData,
  ) async {
    emit(ProjectState.loading());
    DioFactory.setContentType('multipart/form-data');

    final response = await _projectRepository.addProject(projectData);
    response.when(
      success: (projectResponse) {
        emit(ProjectState.success(projectResponse));
      },
      failure: (error) {
        emit(ProjectState.failure(errorMessage: error.message.toString()));
      },
    );
  }
}
