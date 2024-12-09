import 'package:dio/dio.dart';
import 'package:home4u/features/auth/sign_up/data/models/services/engineer_services.dart';
import 'package:home4u/features/auth/sign_up/data/models/services/engineer_type.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../../core/networking/api_constants.dart';

part 'engineer_sign_up_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class EngineerSignUpRemoteDataSource {
  factory EngineerSignUpRemoteDataSource(Dio dio, {String baseUrl}) =
      _EngineerSignUpRemoteDataSource;

  @GET(ApiConstants.engineerTypesEp)
  Future<EngineerTypes> getEngineerTypes();

  @GET("/api/v1/engineer-services/service/{engineerTypeId}")
  Future<EngineerServices> getEngineerServices(
    @Path("engineerTypeId") int engineerTypeId,
  );
}