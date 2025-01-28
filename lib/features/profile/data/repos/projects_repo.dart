import 'package:dio/dio.dart';
import 'package:home4u/core/networking/api_result.dart';
import 'package:home4u/features/profile/data/data_sources/projects_remote_data_source.dart';
import 'package:home4u/features/profile/data/models/delete_project_response_model.dart';
import 'package:home4u/features/profile/data/models/get_projects_response_model.dart';
import 'package:home4u/features/profile/data/models/projects/delete_project_response_model.dart';
import 'package:home4u/features/profile/data/models/projects/get_projects_response_model.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../models/projects/project_response.dart';

abstract class ProjectsRepo {
  Future<ApiResult<GetProjectsResponseModel>> getProjects();

  Future<ApiResult<ProjectResponse>> getProjectsByUserId(
    int projectId,
  );

  Future<ApiResult<DeleteProjectResponseModel>> deleteProjectsByUserId(
    int projectId,
  );

  Future<ApiResult<ProjectResponse>> addProject(FormData projectData);

  Future<ApiResult<ProjectResponse>> updateProject(FormData projectData);
}

class ProjectsRepoImpl implements ProjectsRepo {
  final ProjectsRemoteDataSource _projectsRemoteDataSource;

  ProjectsRepoImpl(this._projectsRemoteDataSource);

  @override
  Future<ApiResult<GetProjectsResponseModel>> getProjects() async {
    try {
      final response = await _projectsRemoteDataSource.getProjects();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<DeleteProjectResponseModel>> deleteProjectsByUserId(
    int projectId,
  ) async {
    try {
      final response = await _projectsRemoteDataSource.deleteProject(projectId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ProjectResponse>> addProject(FormData projectData) async {
    try {
      final response = await _projectsRemoteDataSource.addProject(projectData);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ProjectResponse>> getProjectsByUserId(
    int projectId,
  ) async {
    try {
      final response =
          await _projectsRemoteDataSource.getProjectById(projectId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ProjectResponse>> updateProject(FormData projectData) async {
    try {
      final response =
          await _projectsRemoteDataSource.updateProject(projectData);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
