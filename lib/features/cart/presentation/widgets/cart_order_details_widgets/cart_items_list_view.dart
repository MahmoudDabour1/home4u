import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../cart/data/models/cart_item_model.dart';
import '../../../../cart/logic/cart_cubit.dart';
import 'cart_order_details_item.dart';

class CartItemsListView extends StatelessWidget {
  const CartItemsListView({
    super.key,
    required this.items,
  });

  final List<CartItemModel> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.60,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => CartOrderDetailsItem(
          cartItem: items[index],
          onQuantityChanged: (p0) => context
              .read<CartCubit>()
              .updateQuantity(items[index].product, p0),
          onRemove: () =>
              context.read<CartCubit>().removeFromCart(items[index].product),
        ),
        separatorBuilder: (context, index) => SizedBox(height: 4.h),
        itemCount: items.length,
      ),
    );
  }
}
