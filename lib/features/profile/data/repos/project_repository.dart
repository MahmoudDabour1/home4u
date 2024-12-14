import 'package:dio/dio.dart';
import 'package:home4u/core/networking/api_result.dart';
import 'package:home4u/features/profile/data/data_sources/project_remote_data_source/projects_remote_data_source.dart';
import 'package:home4u/features/profile/data/models/project_response.dart';

import '../../../../core/networking/api_error_handler.dart';

abstract class ProjectRepository {
  Future<ApiResult<ProjectDataResponse>> addProject(FormData projectData);
}

class ProjectRepositoryImpl extends ProjectRepository {
  final ProjectsRemoteDataSource _projectsRemoteDataSource;
  final String? _token;

  ProjectRepositoryImpl(this._projectsRemoteDataSource, this._token);

  @override
  Future<ApiResult<ProjectDataResponse>> addProject(FormData projectData) async {
    try {
      final result = await _projectsRemoteDataSource.addProject(
        projectData,
        'Bearer $_token',
      );
      return ApiResult.success(result.data);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
