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
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import '../../../../core/networking/dio_factory.dart';

class ProjectCubit extends Cubit<ProjectState> {
  final ProjectsRepo _projectRepository;

  ProjectCubit(this._projectRepository) : super(ProjectState.initial());

  static ProjectCubit get(context) => BlocProvider.of(context);

  final projectDescriptionController = TextEditingController(text: "mmmmm");

  final projectNameController = TextEditingController(text: "ncb");
  final projectStartDateController = TextEditingController(text: "2021-09-09");
  final projectEndDateController = TextEditingController(text: "2022-09-09");
  final projectToolsController = TextEditingController(text: "mahmoud");
  File? images;

  File? coverImage;
  Logger printer = Logger();

  void selectImage({required BuildContext context, ImageSource? source}) {
    ImagePicker.platform
        .getImageFromSource(
      source: source!,
    )
        .then((value) {
      if (value != null) {
        images = File(value.path);
        Navigator.pop(context);
        emit(ProjectState.addImage());
      }
    });
  }

  void selectCover({required BuildContext context, ImageSource? source}) {
    ImagePicker.platform
        .getImageFromSource(
      source: source!,
    )
        .then((value) {
      if (value != null) {
        coverImage = File(value.path);
        Navigator.pop(context);
        emit(ProjectState.addCover());
      }
    });
  }

  void getProjects() async {
    emit(const ProjectState.getProjectsLoading());
    final response = await _projectRepository.getProjects();
    response.when(
      success: (getProjectResponseModel) {
        emit(ProjectState.getProjectsSuccess(getProjectResponseModel.data));
      },
      failure: (error) {
        emit(ProjectState.getProjectsError(error: error.message.toString()));
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
        emit(const ProjectState.deleteProjectSuccess());
      },
      failure: (error) {
        emit(ProjectState.deleteProjectError(error: error.message.toString()));
      },
    );
  }

  Future<void> addProject(BuildContext context) async {
    emit(ProjectState.addProjectLoading());
    try {
      final formData = await _createProjectFormData();
      final response = await _projectRepository.addProject(formData);

      response.when(
        success: (projectResponse) {
          showToast(message: "project added successfully");
          projectStartDateController.clear();
          projectEndDateController.clear();
          projectDescriptionController.clear();
          projectToolsController.clear();
          projectNameController.clear();
          coverImage = null;
          images = null;
          emit(ProjectState.addProjectSuccess());
          context.pop();
          // getProjects();
        },
        failure: (error) {
          emit(ProjectState.failure(errorMessage: error.message.toString()));
        },
      );
    } catch (e) {
      showToast(message: "Error: $e", isError: true);
      emit(ProjectState.addProjectError(error: e.toString()));
    }
  }

  Future<void> getProjectById(int projectId) async {
    emit(const ProjectState.getProjectLoading());
    final response = await _projectRepository.getProjectsByUserId(projectId);
    response.when(
      success: (projectResponse) {
        emit(ProjectState.getProjectSuccess(projectResponse));
      },
      failure: (error) {
        emit(ProjectState.getProjectError(error: error.message.toString()));
      },
    );
  }

  Future<void> updateProject(int projectId) async {
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
          coverImage = null;
          images = null;
          emit(ProjectState.updateProjectSuccess());
        },
        failure: (error) {
          emit(ProjectState.failure(errorMessage: error.message.toString()));
        },
      );
    } catch (e) {
      showToast(message: "Error: $e", isError: true);
      emit(ProjectState.updateProjectError(error: e.toString()));
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
    final image = MultipartFile.fromFileSync(
      images!.path,
      filename: images!.path.split("/").last,
      contentType: MediaType('image', 'jpeg'),
    );
    final coverImage = MultipartFile.fromFileSync(
      this.coverImage!.path,
      filename: this.coverImage!.path.split("/").last,
      contentType: MediaType('image', 'jpeg'),
    );
    return FormData.fromMap(
      {
        'projectData': MultipartFile.fromString(
          projectJson,
          contentType: MediaType('application', 'json'),
        ),
        'images': image,
        'coverImage': coverImage,
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
    final image = MultipartFile.fromFileSync(
      images!.path,
      filename: images!.path.split("/").last,
      contentType: MediaType('image', 'jpeg'),
    );
    final coverImage = MultipartFile.fromFileSync(
      this.coverImage!.path,
      filename: this.coverImage!.path.split("/").last,
      contentType: MediaType('image', 'jpeg'),
    );
    return FormData.fromMap(
      {
        'projectData': MultipartFile.fromString(
          projectJson,
          contentType: MediaType('application', 'json'),
        ),
        'images': image,
        'coverImage': coverImage,
      },
    );
  }
}
