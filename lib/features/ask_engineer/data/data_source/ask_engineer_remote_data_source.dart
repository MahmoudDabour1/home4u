import 'package:dio/dio.dart';
import 'package:home4u/features/ask_engineer/data/models/ask_engineer_ikp_response_model.dart';
import 'package:home4u/features/ask_engineer/data/models/ask_engineer_image_body.dart';
import 'package:home4u/features/ask_engineer/data/models/ask_engineer_images_response_model.dart';
import 'package:home4u/features/ask_engineer/data/models/ask_engineer_response_model.dart';
import 'package:home4u/features/ask_engineer/data/models/ask_engineer_upload_image_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/networking/api_constants.dart';

part 'ask_engineer_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class AskEngineerRemoteDataSource {
  factory AskEngineerRemoteDataSource(Dio dio, {String baseUrl}) =
      _AskEngineerRemoteDataSource;

  @GET(ApiConstants.askEngineerIkpEp)
  Future<AskEngineerIkpResponseModel> askEngineerIkp();

  @POST(ApiConstants.askEngineerEp)
  Future<AskEngineerResponseModel> askEngineer(
    @Body() String formData,
  );

  @POST(ApiConstants.addAllAskEngineerImagesEp)
  Future<AskEngineerImagesResponseModel> addAskEngineerImage(
    @Body() List<AskEngineerImageBody> imagesBody,
  );

  @MultiPart()
  @POST("/api/v1/file")
  Future<AskEngineerUploadImageResponse> uploadBusinessImage(
    @Query("pathId") String pathId,
    @Query("id") int id,
    @Body() FormData image,
  );
}
