import 'package:flutter/material.dart';

import '../../../../../core/utils/spacing.dart';
import 'orders_container_widget.dart';

class OrderDeliveredSection extends StatelessWidget {
  const OrderDeliveredSection({super.key});

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
              return OrdersContainerWidget(orderStatus: OrderStatus.delivered);
            },
          )
        ],
      ),
    );
  }
}
