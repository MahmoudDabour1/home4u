import 'package:dio/dio.dart';
import 'package:home4u/features/profile/data/models/profile/engineer_profile_response_model.dart';
import 'package:home4u/features/profile/data/models/profile/technical_worker_profile_response_model.dart';
import 'package:home4u/features/profile/data/models/profile/upload_profile_image_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/networking/api_constants.dart';

part 'profile_remote_data_source.g.dart';
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ProfileRemoteDataSource {
  factory ProfileRemoteDataSource(Dio dio, {String baseUrl}) =
      _ProfileRemoteDataSource;

  @GET(ApiConstants.getEngineerByTokenEp)
  Future<EngineerProfileResponseModel> getEngineerByToken();

  @GET(ApiConstants.getTechnicalWorkerByTokenEp)
  Future<TechnicalWorkerResponseModel> getTechnicalWorkerByToken();

  @PUT(ApiConstants.updateEngineerProfileEP)
  Future<EngineerProfileResponseModel> updateEngineerProfile(
    @Body() String profileResponseModel,
  );

  @PUT(ApiConstants.updateTechnicalWorkerProfileEP)
  Future<TechnicalWorkerResponseModel> updateTechnicalWorkerProfile(
    @Body() String profileResponseModel,
  );

  @POST(ApiConstants.uploadProfileImageEP)
  Future<UploadProfileImageResponseModel> uploadProfileImage(
    @Body() FormData formData,
  );
}
