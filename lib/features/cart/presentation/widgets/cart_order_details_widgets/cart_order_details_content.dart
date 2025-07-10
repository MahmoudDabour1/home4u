import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cart/logic/cart_cubit.dart';
import '../../../../cart/logic/cart_state.dart';
import 'cart_items_order_details_list.dart';
import 'cart_order_details_empty_view.dart';

class CartOrderDetailsContent extends StatelessWidget {
  const CartOrderDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return state.maybeWhen(
          cartLoading: () => const Center(child: CircularProgressIndicator()),
          cartFailure: (error) => Center(child: Text(error)),
          cartEmpty: () => const CartOrderDetailsEmptyView(),
          cartSuccess: (items) {
            final total = items.fold<double>(
              0.0,
              (sum, item) =>
                  sum + (item.product.price ?? 0) * (item.quantity ?? 0),
            );
            return CartItemsOrderDetailsList(items: items, total: total);
          },
          ///Todo: UI here appears empty for about 300ms until it moves to insertOrderSuccess
          ///Solve this by showing a loading indicator or a placeholder
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }
}
