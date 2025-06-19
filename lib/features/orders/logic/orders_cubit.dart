import 'package:bloc/bloc.dart';
import 'package:home4u/features/orders/data/repository/orders_repository.dart';

import 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepository ordersRepository;

  OrdersCubit(this.ordersRepository) : super(const OrdersState.initial());

  Future<void> getOrdersByUserId(String userId, String orderStatus) async {
    emit(const OrdersState.ordersLoading());
    final orders =
        await ordersRepository.getOrdersByUserId(userId, orderStatus);
    orders.when(
      success: (data) => emit(OrdersState.ordersSuccess(data)),
      failure: (error) => emit(OrdersState.ordersFailure(error.toString())),
    );
  }

  Future<void> getOrderDetailsById(String orderId) async {
    emit(const OrdersState.orderDetailsLoading());
    final orderDetails = await ordersRepository.getOrderDetailsById(orderId);
    orderDetails.when(success: (data) {
      emit(OrdersState.orderDetailsSuccess(data));
    }, failure: (error) {
      emit(OrdersState.orderDetailsFailure(error.toString()));
    });
  }
}
