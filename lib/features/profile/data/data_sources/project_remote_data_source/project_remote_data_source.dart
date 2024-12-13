import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/networking/api_constants.dart';

part 'project_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ProjectRemoteDataSource {
  factory ProjectRemoteDataSource(Dio dio, {String baseUrl}) =
      _ProjectRemoteDataSource;

  @POST(ApiConstants.projectAddEp)
  @MultiPart()
  Future<HttpResponse<String>> addProject(
    @Part(name: "projectData") String projectData,
    @Part(name: "images") List<MultipartFile> images,
    @Part(name: "cover") MultipartFile? cover,
  );
}
