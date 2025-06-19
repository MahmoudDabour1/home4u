import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/orders/data/models/orders_response_model.dart';
import 'package:home4u/features/orders/logic/orders_cubit.dart';
import 'package:home4u/features/orders/logic/orders_state.dart';

import '../../../../../core/utils/spacing.dart';
import 'orders_container_widget.dart';

class OrderDeliveredSection extends StatelessWidget {
  const OrderDeliveredSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<OrdersCubit, OrdersState>(
            builder: (context, state) {
              return state.maybeWhen(
                ordersSuccess: (OrdersResponseModel orders) {
                  return  ListView.separated(
                    separatorBuilder: (context, index) => verticalSpace(20),
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
                ordersLoading: () {
                  return SizedBox(
                    child : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    ),
                  );
                },
                orElse: () => SizedBox.shrink(),
              );
            },
          )
        ],
      ),
    );
  }
}
