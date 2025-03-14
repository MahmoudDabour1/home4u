import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/products/data/models/products_response_model.dart';
import 'package:home4u/features/products/logic/products_cubit.dart';
import 'package:home4u/features/products/logic/products_state.dart';
import 'package:home4u/features/products/presentation/widgets/product_shimmer_widget.dart';
import 'package:home4u/features/products/presentation/widgets/products_list_view.dart';

class ProductsBlocBuilder extends StatelessWidget {
  const ProductsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      buildWhen: (previous, current) =>
          current is GetProductsLoading ||
          current is GetProductsSuccess ||
          current is GetProductsFailure,
      builder: (context, state) {
        return state.maybeWhen(
          getProductsLoading: () => setupLoading(),
          getProductsSuccess: (products) => setupSuccess(products),
          getProductsFailure: (message) => setupFailure(message),
          orElse: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
        );
      },
    );
  }

  Widget setupSuccess(ProductsResponseModel products) {
    return ProductsListView(
      content: products.data?.content,
    );
  }

  Widget setupFailure(message) {
    return SliverToBoxAdapter(child: Center(child: Text(message)));
  }

  Widget setupLoading() {
    return ProductShimmerWidget();
  }
}
