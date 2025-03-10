import 'package:dio/dio.dart';
import 'package:home4u/core/networking/api_result.dart';
import 'package:home4u/features/exhibition/data/data_sources/business_add_product_remote_data_source.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../models/add_product_business_response_model.dart';
import '../models/business_add_product_body.dart';
import '../models/business_add_product_images_body.dart';
import '../models/business_add_product_images_response.dart';
import '../models/upload_image_response.dart';

abstract class BusinessAddProductRepository {
  Future<ApiResult<AddProductBusinessResponseModel>> addBusinessProduct(
    BusinessAddProductBody businessAddProductBody,
  );

  Future<ApiResult<BusinessAddProductImagesResponse>> addBusinessProductImage(
    List<BusinessAddProductImagesBody> imagesBody,
  );

  Future<ApiResult<UploadImageResponse>> uploadBusinessImage(
    String pathId,
    int id,
    FormData image,
  );
}

class BusinessAddProductRepositoryImpl implements BusinessAddProductRepository {
  final BusinessAddProductRemoteDataSource _businessAddProductRemoteDataSource;

  BusinessAddProductRepositoryImpl(this._businessAddProductRemoteDataSource);

  @override
  Future<ApiResult<AddProductBusinessResponseModel>> addBusinessProduct(
      BusinessAddProductBody businessAddProductBody) async {
    try {
      final response = await _businessAddProductRemoteDataSource
          .addBusinessProduct(businessAddProductBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<BusinessAddProductImagesResponse>> addBusinessProductImage(
      List<BusinessAddProductImagesBody> imagesBody) async {
    try {
      final response = await _businessAddProductRemoteDataSource
          .addBusinessProductImage(imagesBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<UploadImageResponse>> uploadBusinessImage(
      String pathId, int id, FormData image) async {
    try {
      final response = await _businessAddProductRemoteDataSource
          .uploadBusinessImage(pathId, id, image);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
