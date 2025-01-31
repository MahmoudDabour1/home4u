import 'package:dio/dio.dart';
import 'package:home4u/features/profile/data/models/profile/profile_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/networking/api_constants.dart';

part 'profile_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ProfileRemoteDataSource {
  factory ProfileRemoteDataSource(Dio dio, {String baseUrl}) =
      _ProfileRemoteDataSource;

  @GET(ApiConstants.getEngineerByTokenEp)
  Future<ProfileResponseModel> getEngineerByToken();
}
