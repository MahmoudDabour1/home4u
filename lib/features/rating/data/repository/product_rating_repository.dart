import 'package:home4u/core/networking/api_error_handler.dart';
import 'package:home4u/core/networking/api_result.dart';
import 'package:home4u/features/rating/data/models/insert_product_rate_body.dart';
import 'package:home4u/features/rating/data/models/product_rate_response_model.dart';

import '../data_source/product_rating_remote_data_source.dart';
import '../models/update_product_rate_body.dart';

abstract class ProductRatingRepository {
  Future<ApiResult<ProductRateResponseModel>> insertProductRate(
    InsertProductRateBody productRateBody,
  );

  Future<ApiResult<ProductRateResponseModel>> updateProductRate(
    UpdateProductRateBody productRateBody,
  );

  Future<ApiResult<ProductRateResponseModel>>
      findProductRateByProductIdAndUserId(
    int productId,
    int userId,
  );
}

class ProductRatingRepositoryImpl implements ProductRatingRepository {
  final ProductRatingRemoteDataSource _remoteDataSource;

  ProductRatingRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResult<ProductRateResponseModel>> insertProductRate(
    InsertProductRateBody productRateBody,
  ) async {
    try {
      final response =
          await _remoteDataSource.insertProductRate(productRateBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ProductRateResponseModel>> updateProductRate(
      UpdateProductRateBody productRateBody) async {
    try {
      final response =
          await _remoteDataSource.updateProductRate(productRateBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ProductRateResponseModel>>
      findProductRateByProductIdAndUserId(int productId, int userId) async {
    try {
      final response = await _remoteDataSource
          .findProductRateByProductIdAndUserId(productId, userId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
