import 'package:home4u/core/networking/api_result.dart';
import 'package:home4u/features/profile/data/data_sources/projects_remote_data_source.dart';
import 'package:home4u/features/profile/data/models/delete_project_response_model.dart';
import 'package:home4u/features/profile/data/models/get_projects_response_model.dart';

import '../../../../core/networking/api_error_handler.dart';

abstract class ProjectsRepo {
  Future<ApiResult<GetProjectsResponseModel>> getProjects();

  Future<ApiResult<DeleteProjectResponseModel>> getProjectsByUserId(
      int projectId);
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
  Future<ApiResult<DeleteProjectResponseModel>> getProjectsByUserId(
      int projectId) async {
    try {
      final response = await _projectsRemoteDataSource.deleteProject(projectId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
