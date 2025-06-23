import 'package:dio/dio.dart';
import 'package:home4u/features/orders/data/models/order_details_response_model.dart';
import 'package:home4u/features/orders/data/models/orders_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/cancel_order_response_model.dart';

part 'orders_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class OrdersRemoteDataSource {
  factory OrdersRemoteDataSource(Dio dio, {String baseUrl}) =
      _OrdersRemoteDataSource;

  @GET(ApiConstants.getOrdersEp)
  Future<OrdersResponseModel> getOrdersByUserId(
    @Path('userId') String userId,
    @Query('statusCode') String statusCode,
  );

  @GET(ApiConstants.getOrderDetailsEp)
  Future<OrderDetailsResponseModel> getOrderDetailsById(
    @Path('orderId') String orderId,
  );

  @PUT(ApiConstants.cancelOrderEp)
  Future<CancelOrderResponseModel> cancelOrder(
    @Path('orderId') String orderId,
  );
}
