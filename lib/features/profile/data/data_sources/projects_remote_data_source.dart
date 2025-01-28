import 'package:dio/dio.dart';
import 'package:home4u/features/profile/data/models/get_projects_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/delete_project_response_model.dart';
import '../models/project_response.dart';

part 'projects_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ProjectsRemoteDataSource {
  factory ProjectsRemoteDataSource(Dio dio, {String baseUrl}) =
      _ProjectsRemoteDataSource;

  @GET(ApiConstants.getProjectsEp)
  Future<GetProjectsResponseModel> getProjects();

  @GET("/api/v1/project/{projectId}")
  Future<ProjectResponse> getProjectById(
    @Path("projectId") int projectId,
  );

  @DELETE("/api/v1/project/{projectId}")
  Future<DeleteProjectResponseModel> deleteProject(
    @Path("projectId") int projectId,
  );

  @POST(ApiConstants.projectAddEp)
  @MultiPart()
  Future<ProjectResponse> addProject(
    @Body() FormData projectData,
  );

  @PUT("/api/v1/project")
  @MultiPart()
  Future<ProjectResponse> updateProject(
    @Body() FormData projectData,
  );
}
