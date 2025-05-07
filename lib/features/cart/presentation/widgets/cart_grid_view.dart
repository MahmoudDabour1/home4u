import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_grid_single_item.dart';
import 'package:home4u/features/cart/logic/cart_cubit.dart';
import 'package:home4u/features/cart/logic/cart_state.dart';

class CartGridView extends StatelessWidget {
  const CartGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cubit = context.read<CartCubit>();
        final items = cubit.products;
        final isLoadingMore = cubit.isFetching && !cubit.hasReachedMax;

        return SliverGrid(

          delegate: SliverChildBuilderDelegate(
                (context, index) {
              if (index < items.length) {
                return CartGridSingleItem(content: items[index]);
              } else {
                // Show shimmer for loading more
                return const SizedBox();
              }
            },
            childCount: items.length + (isLoadingMore ? 1 : 0),
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0 / 1.7,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
          ),
        );
      },
    );
  }
}
