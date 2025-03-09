import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/products/logic/products_cubit.dart';
import 'package:home4u/features/products/presentation/widgets/products_item.dart';

import '../../data/models/products_response_model.dart';
import '../../logic/products_state.dart';

class ProductsListView extends StatelessWidget {
  final List<Content>? content;

  const ProductsListView({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      buildWhen: (previous, current) => current is! GetProductsLoading,
      builder: (context, state) {
        final cubit = context.read<ProductsCubit>();
        return SliverList(

          delegate: SliverChildBuilderDelegate(
            (context, index) {
              // if (index == content!.length) {
              //   cubit.getProducts();
              //   return CircularProgressIndicator();
              // } else {

                return ProductsItem(
                  content: content![index],
                );
              // }
            },
            childCount: content!.length + 1,
          ),
        );
      },
    );
  }
}




