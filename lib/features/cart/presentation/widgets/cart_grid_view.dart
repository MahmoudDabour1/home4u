import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_grid_single_item.dart';

class CartGridView extends StatelessWidget {
  const CartGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1 / 1.55,
      crossAxisSpacing: 16.w,
      mainAxisSpacing: 16.h,
      children: List.generate(
        10,
        (index) {
          return CartGridSingleItem();
        },
      ),
    );
  }
}
