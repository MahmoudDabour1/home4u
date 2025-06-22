import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/orders/logic/orders_state.dart';
import 'package:home4u/features/orders/presentation/widgets/order_details_widgets/order_details_buttons.dart';
import 'package:home4u/features/orders/presentation/widgets/order_details_widgets/order_details_card.dart';
import 'package:home4u/features/orders/presentation/widgets/order_details_widgets/order_details_header.dart';
import 'package:home4u/features/orders/presentation/widgets/order_details_widgets/order_details_order_details.dart';
import 'package:home4u/features/orders/presentation/widgets/order_details_widgets/order_details_order_prices.dart';

import '../../../core/utils/spacing.dart';
import '../data/models/orders_response_model.dart';
import '../logic/orders_cubit.dart';

class OrderDetailsScreen extends StatefulWidget {
  final int orderId;
  final OrderStatusCode orderStatus;

  const OrderDetailsScreen({
    super.key,
    required this.orderId,
    required this.orderStatus,
  });

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<OrdersCubit>().getOrderDetailsById(widget.orderId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<OrdersCubit>(),
      child: Scaffold(
        backgroundColor: Color(0xffFAFAFA),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: BlocBuilder<OrdersCubit, OrdersState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orderDetailsSuccess: (orderDetails) {
                      return Column(
                        children: [
                          OrderDetailsHeader(orderId: widget.orderId),
                          verticalSpace(32),
                          OrderDetailsCard(
                              orderDetailsStatusCode: widget.orderStatus),
                          verticalSpace(26),
                          OrderDetailsOrderDetails(
                            orderId: widget.orderId,
                            orderDetails: orderDetails,
                          ),
                          verticalSpace(40),
                          OrderDetailsOrderPrices(
                            order: orderDetails,
                          ),
                          verticalSpace(40),
                          OrderDetailsButtons(
                            orderStatusCode: widget.orderStatus,
                          ),
                          verticalSpace(40),
                        ],
                      );
                    },
                    orElse: () => SizedBox.shrink(),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
