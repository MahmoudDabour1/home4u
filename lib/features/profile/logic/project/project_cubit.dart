import 'package:bloc/bloc.dart';
import 'package:home4u/features/profile/data/repos/project_repository.dart';
import 'package:home4u/features/profile/logic/project/project_state.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/models/project_data.dart';

class ProjectCubit extends Cubit<ProjectState> {
  final ProjectRepository _projectRepository;

  ProjectCubit(this._projectRepository) : super(const ProjectState.initial());

  Future<void> addProject(
    ProjectData projectData,
    List<XFile> images,
    XFile? coverImage,
    String? token,
  ) async {
    emit(const ProjectState.loading());
    final result = await _projectRepository.addProject(
      projectData,
      images,
      coverImage,
      token,
    );

    ///Modify
    result.when(
      success: (data) {
        emit(ProjectState.success(data));
      },
      failure: (error) {
        emit(ProjectState.failure(errorMessage: error.message));
      },
    );
  }
}
