import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cart/logic/cart_cubit.dart';
import '../../../../cart/logic/cart_state.dart';
import 'order_details_cart_items_list.dart';
import 'order_details_empty_cart_view.dart';

class OrderDetailsContent extends StatelessWidget {
  const OrderDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return state.maybeWhen(
          cartLoading: () => const Center(child: CircularProgressIndicator()),
          cartFailure: (error) => Center(child: Text(error)),
          cartSuccess: (items) {
            final total = items.fold<double>(
              0.0,
              (sum, item) =>
                  sum + (item.product.price ?? 0) * (item.quantity ?? 0),
            );
            return items.isEmpty
                ? const OrderDetailsEmptyCartView()
                : OrderDetailsCartItemsList(items: items, total: total);
          },
          orElse: () => const OrderDetailsEmptyCartView(),
        );
      },
    );
  }
}
