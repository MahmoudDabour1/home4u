import 'package:flutter/material.dart';
import 'package:home4u/features/products/presentation/widgets/products_item.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return const ProductsItem();
        },
        childCount: 3,
      ),
    );
  }
}
