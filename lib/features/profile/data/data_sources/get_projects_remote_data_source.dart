
import 'package:dio/dio.dart';
import 'package:home4u/features/profile/data/models/get_projects_response_model.dart';
import 'package:retrofit/http.dart';

import '../../../../core/networking/api_constants.dart';
part 'get_projects_remote_data_source.g.dart';
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class GetProjectsRemoteDataSource {
  factory GetProjectsRemoteDataSource(Dio dio, {String baseUrl}) =
      _GetProjectsRemoteDataSource;

  @GET(ApiConstants.getProjectsEp)
  Future<GetProjectsResponseModel> getProjects();
}