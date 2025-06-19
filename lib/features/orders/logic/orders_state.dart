import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/orders/data/models/order_details_response_model.dart';
import 'package:home4u/features/orders/data/models/orders_response_model.dart';

part 'orders_state.freezed.dart';

@freezed
class OrdersState<T> with _$OrdersState<T> {
  const factory OrdersState.initial() = _Initial;

  ///getOrderDetailsById
  const factory OrdersState.orderDetailsLoading() = OrderDetailsLoading;

  const factory OrdersState.orderDetailsSuccess(OrderDetailsResponseModel orderDetails) =
      OrderDetailsSuccess;

  const factory OrdersState.orderDetailsFailure(String message) =
      OrderDetailsFailure;

  ///getOrdersByUserId
  const factory OrdersState.ordersLoading() = OrdersLoading;

  const factory OrdersState.ordersSuccess(OrdersResponseModel orders) = OrdersSuccess;

  const factory OrdersState.ordersFailure(String message) = OrdersFailure;
}
