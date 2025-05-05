import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/ask_technical_ikp_response_model.dart';
import '../models/ask_technical_image_body.dart';
import '../models/ask_technical_images_response_model.dart';
import '../models/ask_technical_response_model.dart';
import '../models/ask_technical_upload_image_response.dart';

part 'ask_technical_remote_data_source.g.dart';

@RestApi(  baseUrl: ApiConstants.apiBaseUrl)
abstract class AskTechnicalRemoteDataSource {
  factory AskTechnicalRemoteDataSource(Dio dio, {String baseUrl}) =
      _AskTechnicalRemoteDataSource;

  @GET(ApiConstants.askWorkerIkpEp)
  Future<AskTechnicalIkpResponseModel> askTechnicalIkp();

  @POST(ApiConstants.askWorkerEp)
  Future<AskTechnicalResponseModel> askTechnical(
    @Body() String formData,
  );

  @POST(ApiConstants.addAllAskWorkerImagesEp)
  Future<AskTechnicalImageResponseModel> addAskTechnicalImage(
    @Body() List<AskTechnicalImageBody> imagesBody,
  );

  @MultiPart()
  @POST("/api/v1/file")
  Future<AskTechnicalUploadImageResponse> uploadBusinessImage(
    @Query("pathId") String pathId,
    @Query("id") int id,
    @Body() FormData image,
  );
}