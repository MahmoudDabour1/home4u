import 'dart:io';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:home4u/features/profile/data/repos/projects_repo.dart';
import 'package:home4u/features/profile/logic/project/project_state.dart';
import 'package:path/path.dart';
import 'package:retrofit/http.dart';

import '../../data/models/add_project_body.dart';

class ProjectCubit extends Cubit<ProjectState> {
  final ProjectsRepo _projectRepository;

  ProjectCubit(this._projectRepository) : super(ProjectState.initial());

  Future<void> addProject(
      AddProjectBody projectData,
      List<MultipartFile>? images,
      MultipartFile? cover,
      ) async {
    emit(ProjectState.loading());
    try {
      final formData = FormData()
        ..fields.add(
          MapEntry(
            'projectData',
            jsonEncode(projectData.toJson()),
          ),
        );

      if (images != null) {
        for (var image in images) {
          formData.files.add(
            MapEntry(
              'images',
              image,
            ),
          );
        }
      }

      if (cover != null) {
        formData.files.add(
          MapEntry(
            'cover',
            cover,
          ),
        );
      }
      final result = await _projectRepository.addProject(formData);
      emit(ProjectState.success(result));
    } catch (e) {
      emit(ProjectState.failure(errorMessage: e.toString()));
    }
  }
}