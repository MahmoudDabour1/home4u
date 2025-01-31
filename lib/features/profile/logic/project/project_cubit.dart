import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/helpers/helper_methods.dart';
import 'package:home4u/features/profile/data/models/projects/add_project_body.dart';
import 'package:home4u/features/profile/data/repos/projects_repo.dart';
import 'package:home4u/features/profile/logic/project/project_state.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/networking/dio_factory.dart';

class ProjectCubit extends Cubit<ProjectState> {
  final ProjectsRepo _projectRepository;

  ProjectCubit(this._projectRepository) : super(ProjectState.initial());

  static ProjectCubit get(context) => BlocProvider.of(context);

  final projectDescriptionController = TextEditingController(text: "jhgvbr");

  final projectNameController = TextEditingController(text: "ncb");
  final projectStartDateController = TextEditingController(text: "2021-09-09");
  final projectEndDateController = TextEditingController(text: "2022-09-09");
  final projectToolsController = TextEditingController(text:  "fvebbv");
  File? images;

  File? coverImage;

  // void selectImage({required ImageSource source, required BuildContext context, bool isCoverImage = false}) async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: source);
  //   if (pickedFile != null) {
  //     final selectedImage = File(pickedFile.path);
  //
  //     if (isCoverImage) {
  //       coverImage = selectedImage;
  //     } else {
  //       images = selectedImage;
  //     }
  //     emit(ProjectState.addImage()); // You can emit different states as per your logic
  //   } else {
  //     emit(ProjectFailureState(errorMessage: "No image selected"));
  //   }
  // }

  void selectImage({required BuildContext context, ImageSource? source}) {
    ImagePicker.platform
        .getImage(
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
        .getImage(
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
    final response = await _projectRepository.getProjectsByUserId(projectId);
    response.when(
      success: (deleteProjectResponseModel) {
        emit(const ProjectState.deleteProjectSuccess());
      },
      failure: (error) {
        emit(ProjectState.deleteProjectError(error: error.message.toString()));
      },
    );
  }

  Future<void> addProject(context) async {
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
          emit(ProjectState.success(projectResponse));
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
}
