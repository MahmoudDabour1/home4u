import 'package:dio/dio.dart';
import 'package:home4u/features/profile/data/models/projects/get_projects_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/projects/delete_project_response_model.dart';
import '../models/projects/project_response.dart';

part 'projects_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ProjectsRemoteDataSource {
  factory ProjectsRemoteDataSource(Dio dio, {String baseUrl}) =
      _ProjectsRemoteDataSource;

  @GET(ApiConstants.getProjectsEp)
  Future<GetProjectsResponseModel> getProjects();

  @DELETE("/api/v1/project/{projectId}")
  Future<DeleteProjectResponseModel> deleteProject(
    @Path("projectId") int projectId,
  );

  @POST(ApiConstants.projectAddEp)
  @MultiPart()
  Future<ProjectResponse> addProject(
    @Body() FormData projectData,
  );
}
