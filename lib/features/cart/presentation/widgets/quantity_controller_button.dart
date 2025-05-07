import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../data/models/shop_now_response_model.dart';
import '../../logic/cart_cubit.dart';
class QuantityControllerButton extends StatefulWidget {
  final ShopNowContent content;

  const QuantityControllerButton({super.key, required this.content});

  @override
  State<QuantityControllerButton> createState() =>
      _QuantityControllerButtonState();
}

class _QuantityControllerButtonState extends State<QuantityControllerButton> {
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0) {
      return IconButton(
        onPressed: () {
          setState(() => itemCount = 1);
          context.read<CartCubit>().addToCart(widget.content);
        },
        icon: Icon(Icons.add, color: Colors.white),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
        ),
      );
    } else {
      return Row(
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              setState(() {
                if (itemCount > 1) {
                  itemCount--;
                  context
                      .read<CartCubit>()
                      .updateQuantity(widget.content, itemCount);
                } else {
                  itemCount = 0;
                  context.read<CartCubit>().removeFromCart(widget.content);
                }
              });
            },
          ),
          Text('$itemCount'),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() => itemCount++);
              context
                  .read<CartCubit>()
                  .updateQuantity(widget.content, itemCount);
            },
          ),
        ],
      );
    }
  }
}
