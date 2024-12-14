import 'package:dio/dio.dart';
import 'package:home4u/features/profile/data/models/project_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/networking/api_constants.dart';

part 'projects_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ProjectsRemoteDataSource {
  factory ProjectsRemoteDataSource(Dio dio, {String baseUrl}) =
  _ProjectsRemoteDataSource;

  @POST(ApiConstants.projectAddEp)
  @MultiPart()
  Future<ProjectResponse> addProject(
      @Body() FormData projectData,
      @Header("Authorization") String token,
      );
}