import 'package:home4u/core/networking/api_result.dart';
import 'package:home4u/features/profile/data/data_sources/get_projects_remote_data_source.dart';
import 'package:home4u/features/profile/data/models/get_projects_response_model.dart';

import '../../../../core/networking/api_error_handler.dart';

class GetProjectsRepo {
  final GetProjectsRemoteDataSource _getProjectsRemoteDataSource;

  GetProjectsRepo(this._getProjectsRemoteDataSource);

  Future<ApiResult<GetProjectsResponseModel> >getProjects() async {
    try {
      final response = await _getProjectsRemoteDataSource.getProjects();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}