import 'package:home4u/features/orders/data/models/order_details_response_model.dart';
import 'package:home4u/features/orders/data/models/orders_response_model.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../data_source/orders_remote_data_source.dart';
import '../models/cancel_order_response_model.dart';

abstract class OrdersRepository {
  Future<ApiResult<OrderDetailsResponseModel>> getOrderDetailsById(
      String orderId);

  Future<ApiResult<OrdersResponseModel>> getOrdersByUserId(
    String userId,
    String statusCode,
  );

  Future<ApiResult<CancelOrderResponseModel>> cancelOrder(String orderId);
}

class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersRemoteDataSource ordersRemoteDataSource;

  OrdersRepositoryImpl({
    required this.ordersRemoteDataSource,
  });

  @override
  Future<ApiResult<OrderDetailsResponseModel>> getOrderDetailsById(
      String orderId) async {
    try {
      final response =
          await ordersRemoteDataSource.getOrderDetailsById(orderId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<OrdersResponseModel>> getOrdersByUserId(
      String userId, String statusCode) async {
    try {
      final response = await ordersRemoteDataSource.getOrdersByUserId(
        userId,
        statusCode,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<CancelOrderResponseModel>> cancelOrder(
      String orderId) async {
    try {
      final response = await ordersRemoteDataSource.cancelOrder(orderId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
