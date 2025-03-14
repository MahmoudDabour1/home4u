import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/products/logic/products_cubit.dart';
import 'package:home4u/features/products/logic/products_state.dart';
import 'package:home4u/features/products/presentation/widgets/products_item.dart';

import '../../data/models/products_response_model.dart';

class ProductsListView extends StatelessWidget {
  final List<Content> content;

  const ProductsListView({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        final cubit = context.read<ProductsCubit>();
        final isLoadingMore = cubit.isFetching && cubit.products.isNotEmpty;

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index == cubit.products.length) {
                return const Center(child: CircularProgressIndicator());
              }
              return ProductsItem(content: cubit.products[index]);
            },
            childCount: cubit.products.length + (isLoadingMore ? 1 : 0),
          ),
        );
      },
    );
  }
}
