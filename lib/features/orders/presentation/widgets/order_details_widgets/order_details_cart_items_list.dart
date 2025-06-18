import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../cart/data/models/cart_item_model.dart';
import '../../../../cart/logic/cart_cubit.dart';
import 'checkout_section.dart';
import 'order_details_item.dart';

class OrderDetailsCartItemsList extends StatelessWidget {
  final List<CartItemModel> items;
  final double total;

  const OrderDetailsCartItemsList({
    super.key,
    required this.items,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.65,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => OrderDetailsItem(
              cartItem: items[index],
              onQuantityChanged: (p0) =>
                  context.read<CartCubit>().updateQuantity(items[index].product, p0),
              onRemove: () =>
                  context.read<CartCubit>().removeFromCart(items[index].product),
            ),
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemCount: items.length,
          ),
        ),
        CheckoutSection(total: total),
      ],
    );
  }
}
