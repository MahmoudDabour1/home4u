import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/orders/data/models/orders_response_model.dart';
import 'package:home4u/features/orders/logic/orders_cubit.dart';
import 'package:home4u/features/orders/logic/orders_state.dart';
import 'package:home4u/features/orders/presentation/widgets/order_empty_state_widget.dart';
import 'package:home4u/features/orders/presentation/widgets/orders_widgets/order_loading_state_widget.dart';

import '../../../../../core/utils/spacing.dart';
import 'orders_container_widget.dart';

class OrderDeliveredSection extends StatefulWidget {
  const OrderDeliveredSection({super.key});

  @override
  State<OrderDeliveredSection> createState() => _OrderDeliveredSectionState();
}

class _OrderDeliveredSectionState extends State<OrderDeliveredSection> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<OrdersCubit, OrdersState>(
            builder: (context, state) {
              return state.maybeWhen(
                ordersSuccess: (OrdersResponseModel orders) {
                  return orders.data.isEmpty
                      ? OrderEmptyStateWidget()
                      : ListView.separated(
                          separatorBuilder: (context, index) =>
                              verticalSpace(20),
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: orders.data.length,
                          itemBuilder: (context, index) {
                            return OrdersContainerWidget(
                              orderStatus: orders.data[index].status.code,
                              order: orders.data[index],
                            );
                          },
                        );
                },
                ordersLoading: () => OrderLoadingStateWidget(),
                orElse: () => SizedBox.shrink(),
              );
            },
          )
        ],
      ),
    );
  }
}
