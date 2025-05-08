import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/app_colors.dart';
import '../../data/models/cart_item_model.dart';
import '../../data/models/shop_now_response_model.dart';
import '../../logic/cart_cubit.dart';
import '../../logic/cart_state.dart';

class QuantityControllerButton extends StatelessWidget {
  final ShopNowContent content;

  const QuantityControllerButton({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cart = context.read<CartCubit>();
        final cartItem = cart.getCartItems().firstWhere(
              (item) => item.product.id == content.id,
              orElse: () => CartItemModel(product: content, quantity: 0),
            );

        if (cartItem.quantity == 0) {
          return IconButton(
            onPressed: () => cart.addToCart(content),
            icon: const Icon(Icons.add, color: Colors.white),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
            ),
          );
        }

        return Row(
          children: [
            ///Minus button
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                if (cartItem.quantity > 1) {
                  cart.updateQuantity(content, cartItem.quantity - 1);
                } else {
                  cart.removeFromCart(cartItem.product);
                }
              },
            ),
            Text('${cartItem.quantity}'),
            ///Plus button
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () =>
                  cart.updateQuantity(content, cartItem.quantity + 1),
            ),
          ],
        );
      },
    );
  }
}
