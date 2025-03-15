import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/products/logic/products_cubit.dart';
import 'package:home4u/features/products/logic/products_state.dart';
import 'package:home4u/features/products/presentation/widgets/products_item.dart';
import '../../data/models/products_response_model.dart';

class ProductsListView extends StatefulWidget {
  final List<Content> content;

  const ProductsListView({super.key, required this.content});

  @override
  State<ProductsListView> createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final cubit = context.read<ProductsCubit>();

    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      if (!cubit.hasReachedMax) {
        cubit.getProducts();
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        final cubit = context.read<ProductsCubit>();
        final isLoadingMore = !cubit.hasReachedMax && state is GetProductsLoading && cubit.products.isNotEmpty;

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
