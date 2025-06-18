import 'package:flutter/material.dart';
import 'package:home4u/core/utils/spacing.dart';

import 'orders_container_widget.dart';

class OrderPendingSection extends StatelessWidget {
  const OrderPendingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.separated(
            separatorBuilder: (context, index) => verticalSpace(20),
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return OrdersContainerWidget(orderStatus: OrderStatus.pending);
            },
          )
        ],
      ),
    );
  }
}
