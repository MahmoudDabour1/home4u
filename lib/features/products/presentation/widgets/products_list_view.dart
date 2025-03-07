import 'package:flutter/material.dart';
import 'package:home4u/features/products/presentation/widgets/products_item.dart';

import '../../data/models/products_response_model.dart';

class ProductsListView extends StatelessWidget {
  final List<Content>? content;

  const ProductsListView({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return  ProductsItem(content: content![index],);
        },
        childCount: content!.length,
      ),
    );
  }
}
