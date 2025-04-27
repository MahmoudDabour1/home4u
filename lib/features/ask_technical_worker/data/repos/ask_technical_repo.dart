


import 'package:dio/dio.dart';
import 'package:home4u/features/ask_technical_worker/data/models/ask_technical_ikp_response_model.dart';
import 'package:home4u/features/ask_technical_worker/data/models/ask_technical_response_model.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../data_source/ask_technical_remote_data_source.dart';
import '../models/ask_technical_image_body.dart';
import '../models/ask_technical_images_response_model.dart';
import '../models/ask_technical_upload_image_response.dart';

abstract class AskTechnicalRepo {
  Future<ApiResult<AskTechnicalIkpResponseModel>> askTechnicalIkp();

  Future<ApiResult<AskTechnicalResponseModel>> askTechnical(String formData);

  Future<ApiResult<AskTechnicalImageResponseModel>> addAskTechnicalImage(
    List<AskTechnicalImageBody> imagesBody,
  );

  Future<ApiResult<AskTechnicalUploadImageResponse>> uploadAskTechnicalImage(
    String pathId,
    int id,
    FormData image,
  );
}

class AskTechnicalRepoImpl implements AskTechnicalRepo {
  final AskTechnicalRemoteDataSource _askTechnicalRemoteDataSource;

  AskTechnicalRepoImpl(this._askTechnicalRemoteDataSource);

  @override
  Future<ApiResult<AskTechnicalImageResponseModel>> addAskTechnicalImage(List<AskTechnicalImageBody> imagesBody) async{
    try {
      final response = await _askTechnicalRemoteDataSource.addAskTechnicalImage(imagesBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<AskTechnicalResponseModel>> askTechnical(String formData) async{
    try {
      final response = await _askTechnicalRemoteDataSource.askTechnical(formData);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<AskTechnicalIkpResponseModel>> askTechnicalIkp() async{
    try {
      final response = await _askTechnicalRemoteDataSource.askTechnicalIkp();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<AskTechnicalUploadImageResponse>> uploadAskTechnicalImage(String pathId, int id, FormData image)async {
    try {
      final response = await _askTechnicalRemoteDataSource.uploadBusinessImage(
          pathId, id, image);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }


}
