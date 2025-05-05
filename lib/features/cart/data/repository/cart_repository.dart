import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../data_source/cart_remote_data_source.dart';
import '../models/shop_now_response_model.dart';
import '../models/shop_now_search_body.dart';

abstract class CartRepository {
  Future<ApiResult<ShopNowResponseModel>> shopNow(
    ShopNowSearchBody shopNowRequest,
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
}