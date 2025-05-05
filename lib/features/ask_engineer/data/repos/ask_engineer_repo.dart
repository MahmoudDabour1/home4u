import 'package:dio/dio.dart';
import 'package:home4u/features/ask_engineer/data/models/ask_engineer_image_body.dart';
import 'package:home4u/features/ask_engineer/data/models/ask_engineer_images_response_model.dart';
import 'package:home4u/features/ask_engineer/data/models/ask_engineer_response_model.dart';
import 'package:home4u/features/ask_engineer/data/models/ask_engineer_upload_image_response.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../data_source/ask_engineer_remote_data_source.dart';
import '../models/ask_engineer_ikp_response_model.dart';

abstract class AskEngineerRepo {
  Future<ApiResult<AskEngineerIkpResponseModel>> askEngineerIkp();

  Future<ApiResult<AskEngineerResponseModel>> askEngineer(String formData);

  Future<ApiResult<AskEngineerImagesResponseModel>> addAskEngineerImage(
    List<AskEngineerImageBody> imagesBody,
  );

  Future<ApiResult<AskEngineerUploadImageResponse>> uploadAskEngineerImage(
    String pathId,
    int id,
    FormData image,
  );
}

class AskEngineerRepoImpl implements AskEngineerRepo {
  final AskEngineerRemoteDataSource _askEngineerRemoteDataSource;

  AskEngineerRepoImpl(this._askEngineerRemoteDataSource);

  @override
  Future<ApiResult<AskEngineerIkpResponseModel>> askEngineerIkp() async {
    try {
      final response = await _askEngineerRemoteDataSource.askEngineerIkp();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<AskEngineerResponseModel>> askEngineer(
    String formData,
  ) async {
    try {
      final response = await _askEngineerRemoteDataSource.askEngineer(formData);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<AskEngineerImagesResponseModel>> addAskEngineerImage(
      List<AskEngineerImageBody> imagesBody) async {
    try {
      final response =
          await _askEngineerRemoteDataSource.addAskEngineerImage(imagesBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<AskEngineerUploadImageResponse>> uploadAskEngineerImage(
      String pathId, int id, FormData image) async {
    try {
      final response = await _askEngineerRemoteDataSource.uploadBusinessImage(
          pathId, id, image);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
