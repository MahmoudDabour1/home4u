import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/helpers/helper_methods.dart';
import 'package:home4u/features/profile/data/models/projects/add_project_body.dart';
import 'package:home4u/features/profile/data/models/projects/project_data.dart';
import 'package:home4u/features/profile/data/repos/projects_repo.dart';
import 'package:home4u/features/profile/logic/project/project_state.dart';
import 'package:http_parser/http_parser.dart';
import 'package:logger/logger.dart';

import '../../../../core/networking/dio_factory.dart';

class ProjectCubit extends Cubit<ProjectState> {
  final ProjectsRepo _projectRepository;

  ProjectCubit(this._projectRepository) : super(ProjectState.initial());

  static ProjectCubit get(context) => BlocProvider.of(context);

  final projectDescriptionController = TextEditingController();
  final projectNameController = TextEditingController();
  final projectStartDateController = TextEditingController();
  final projectEndDateController = TextEditingController();
  final projectToolsController = TextEditingController();
  List<File> images = [];
  List<File> coverImage =[];
  Logger printer = Logger();
  final formKey = GlobalKey<FormState>();


  void updateSelectedImages(List<File> newImages) {
    images = [ ...newImages];
    emit(ProjectState.addImage(images));
  }
  void updateSelectedCoversImages(List<File> newImages) {
    coverImage = [ ...newImages];
    emit(ProjectState.addCover(coverImage));
  }


  getProjects() async {
    emit(const ProjectState.getProjectsLoading());
    final dio = DioFactory.getDio();
    dio.options.headers.remove('Content-Type');
    final response = await _projectRepository.getProjects();
    response.when(
      success: (getProjectResponseModel) {
        if (!isClosed) {
          emit(ProjectState.getProjectsSuccess(getProjectResponseModel.data));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(ProjectState.getProjectsError(error: error.message.toString()));
        }
      },
    );
  }

  Future<void> deleteProject(int projectId) async {
    emit(const ProjectState.deleteProjectLoading());
    final response = await _projectRepository.deleteProjectsByUserId(projectId);
    response.when(
      success: (deleteProjectResponseModel) {
        Logger printer = Logger();
        printer.i(deleteProjectResponseModel);
        if (!isClosed) {
          emit(const ProjectState.deleteProjectSuccess());
          getProjects();
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(
              ProjectState.deleteProjectError(error: error.message.toString()));
        }
      },
    );
  }

  Future<void> addProject(BuildContext context) async {
    emit(ProjectState.addProjectLoading());
    try {
      final formData = await _createProjectFormData();
      Logger()
          .d("Headers before request: ${DioFactory.getDio().options.headers}");

      // Set Content-Type only when sending FormData
      DioFactory.setContentTypeForMultipart();

      final response = await _projectRepository.addProject(formData);

      response.when(
        success: (projectResponse) {
          showToast(message: "Project added successfully");
          projectStartDateController.clear();
          projectEndDateController.clear();
          projectDescriptionController.clear();
          projectToolsController.clear();
          projectNameController.clear();
          coverImage = [];
          images = [];
          if (!isClosed) {
            emit(ProjectState.addProjectSuccess());
            context.pop(); // Close the add project screen
            getProjects(); // Refresh the project list
          }
        },
        failure: (error) {
          Logger().e("Error adding project: ${error.message}");
          if (!isClosed) {
            emit(ProjectState.failure(errorMessage: error.message.toString()));
          }
        },
      );
    } catch (e) {
      showToast(message: "Error: $e", isError: true);
      if (!isClosed) {
        emit(ProjectState.addProjectError(error: e.toString()));
      }
    }
  }

  Future<void> getProjectById(int projectId) async {
    emit(const ProjectState.getProjectLoading());
    DioFactory.setContentType("application/json");

    final response = await _projectRepository.getProjectsByUserId(projectId);
    response.when(
      success: (projectResponse) {
        if (!isClosed) {
          emit(ProjectState.getProjectSuccess(projectResponse));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(ProjectState.getProjectError(error: error.message.toString()));
        }
      },
    );
  }

  Future<void> updateProject(int projectId, BuildContext context) async {
    emit(const ProjectState.updateProjectLoading());
    try {
      final formData = await _updateProjectFormData(projectId);
      final response = await _projectRepository.updateProject(formData);

      response.when(
        success: (projectResponse) {
          showToast(message: "project updated successfully");
          projectStartDateController.clear();
          projectEndDateController.clear();
          projectDescriptionController.clear();
          projectToolsController.clear();
          projectNameController.clear();
          coverImage = [];
          images = [];
          if (!isClosed) {
            emit(ProjectState.updateProjectSuccess());
            Navigator.pop(context);
            getProjects();
          }
        },
        failure: (error) {
          if (!isClosed) {
            emit(ProjectState.failure(errorMessage: error.message.toString()));
          }
        },
      );
    } catch (e) {
      showToast(message: "Error: $e", isError: true);
      if (!isClosed) {
        emit(ProjectState.updateProjectError(error: e.toString()));
      }
    }
  }

  Future<FormData> _createProjectFormData() async {
    final projectMap = AddProjectBody(
      name: projectNameController.text,
      description: projectDescriptionController.text,
      startDate: projectStartDateController.text,
      endDate: projectEndDateController.text,
      tools: projectToolsController.text,
    );
    final projectJson = json.encode(projectMap);
    DioFactory.setContentType("multipart/form-data");

    final imageFiles = images
        .map((image) => MultipartFile.fromFileSync(
              image.path,
              filename: image.path.split("/").last,
              contentType: MediaType('image', 'jpeg'),
            ))
        .toList();    final coverImageFiles = images
        .map((image) => MultipartFile.fromFileSync(
              image.path,
              filename: image.path.split("/").last,
              contentType: MediaType('image', 'jpeg'),
            ))
        .toList();
    return FormData.fromMap(
      {
        'projectData': MultipartFile.fromString(
          projectJson,
          contentType: MediaType('application', 'json'),
        ),
        'images': imageFiles,
        'coverImage': coverImageFiles,
      },
    );
  }

  Future<FormData> _updateProjectFormData(int projectId) async {
    final projectMap = ProjectData(
      id: projectId,
      name: projectNameController.text,
      description: projectDescriptionController.text,
      startDate: projectStartDateController.text,
      endDate: projectEndDateController.text,
      tools: projectToolsController.text,
    );
    final projectJson = json.encode(projectMap);
    DioFactory.setContentType("multipart/form-data");

    final imageFiles = images
        .map((image) => MultipartFile.fromFileSync(
              image.path,
              filename: image.path.split("/").last,
              contentType: MediaType('image', 'jpeg'),
            ))
        .toList();

    final coverImageFiles = images
        .map((image) => MultipartFile.fromFileSync(
      image.path,
      filename: image.path.split("/").last,
      contentType: MediaType('image', 'jpeg'),
    ))
        .toList();

    return FormData.fromMap(
      {
        'projectData': MultipartFile.fromString(
          projectJson,
          contentType: MediaType('application', 'json'),
        ),
        'images': imageFiles,
        'coverImage': coverImageFiles,
      },
    );
  }
}
