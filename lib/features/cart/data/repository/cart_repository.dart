import 'package:home4u/features/cart/data/models/rating_response_model.dart';
import 'package:home4u/features/cart/data/models/rating_reviews_request_model.dart';
import 'package:home4u/features/cart/data/models/rating_reviews_response_model.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../data_source/cart_remote_data_source.dart';
import '../models/order_details_body.dart';
import '../models/order_details_response.dart';
import '../models/shop_now_response_model.dart';
import '../models/shop_now_search_body.dart';

abstract class CartRepository {
  Future<ApiResult<ShopNowResponseModel>> shopNow(
    ShopNowSearchBody shopNowRequest,
  );

  Future<ApiResult<OrderDetailsResponse>> insertOrder(
    OrderDetailsBody orderDetailsBody,
  );

  Future<ApiResult<RatingResponseModel>> getProductRate(
    int productId,
  );

  Future<ApiResult<RatingReviewResponseModel>> getRateReviews(
    RatingReviewRequestModel ratingReviewRequestModel,
  );
}

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl({
    required this.cartRemoteDataSource,
  });

  @override
  Future<ApiResult<ShopNowResponseModel>> shopNow(
    ShopNowSearchBody shopNowRequest,
  ) async {
    try {
      final response = await cartRemoteDataSource.shopNow(shopNowRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<OrderDetailsResponse>> insertOrder(
      OrderDetailsBody orderDetailsBody) async {
    try {
      final response = await cartRemoteDataSource.insertOrder(orderDetailsBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<RatingResponseModel>> getProductRate(int productId) async {
    try {
      final response = await cartRemoteDataSource.getProductRates(productId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<RatingReviewResponseModel>> getRateReviews(
      RatingReviewRequestModel ratingReviewRequestModel) async {
    try {
      final response =
          await cartRemoteDataSource.getRatesReviews(ratingReviewRequestModel);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
