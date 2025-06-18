import 'package:flutter/material.dart';
import '../../../../cart/data/models/cart_item_model.dart';
import 'cart_items_list_view.dart';
import 'checkout_section.dart';

class CartItemsOrderDetailsList extends StatelessWidget {
  final List<CartItemModel> items;
  final double total;

  const CartItemsOrderDetailsList({
    super.key,
    required this.items,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CartItemsListView(items: items),
        CheckoutSection(total: total),
      ],
    );
  }
}
