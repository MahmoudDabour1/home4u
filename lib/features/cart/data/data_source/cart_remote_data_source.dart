import 'package:dio/dio.dart';
import 'package:home4u/features/cart/data/models/order_details_response.dart';
import 'package:home4u/features/cart/data/models/shop_now_search_body.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/order_details_body.dart';
import '../models/shop_now_response_model.dart';

part 'cart_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class CartRemoteDataSource {
  factory CartRemoteDataSource(Dio dio, {String baseUrl}) =
      _CartRemoteDataSource;

  @POST(ApiConstants.shopNowEp)
  Future<ShopNowResponseModel> shopNow(
    @Body() ShopNowSearchBody shopNowRequest,
  );

  @POST(ApiConstants.ordersEp)
  Future<OrderDetailsResponse> insertOrder(
    @Body() OrderDetailsBody orderDetailsBody,
  );
}
