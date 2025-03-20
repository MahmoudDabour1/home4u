import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/products/data/models/products_response_model.dart';
import 'package:home4u/features/products/logic/products_cubit.dart';
import 'package:home4u/features/products/logic/products_state.dart';
import 'package:home4u/features/products/presentation/widgets/product_shimmer_widget.dart';
import 'package:home4u/features/products/presentation/widgets/products_list_view.dart';

import '../../../../core/routing/router_observer.dart';
import '../../../exhibition/logic/business_add_product_cubit.dart';

class ProductsBlocBuilder extends StatefulWidget {
  const ProductsBlocBuilder({super.key});

  @override
  State<ProductsBlocBuilder> createState() => _ProductsBlocBuilderState();
}

class _ProductsBlocBuilderState extends State<ProductsBlocBuilder>
    with RouteAware {
  late BusinessAddProductCubit _addProductCubit;
  final RouteObserver<ModalRoute> _routeObserver = RouteObserver<ModalRoute>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void didPush() {
    logger.i('Navigated to Products Page');
  }

  @override
  void didPop() {
    logger.i('Exited from Products Page');
  }

  @override
  void didPopNext() {
    final productsCubit = context.read<ProductsCubit>();
    productsCubit.resetPagination();
    productsCubit.getProducts(isRefresh: true);
  }

  @override
  void dispose() {
    _routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      buildWhen: (previous, current) =>
          current is GetProductsLoading ||
          current is GetProductsSuccess ||
          current is GetProductsFailure,
      builder: (context, state) {
        return state.maybeWhen(
          getProductsLoading: () => ProductShimmerWidget(),
          getProductsSuccess: (products) => setupSuccess(products),
          getProductsFailure: (message) => setupFailure(message),
          orElse: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
        );
      },
    );
  }

  Widget setupSuccess(ProductsResponseModel products) {
    return products.data?.empty == true ||
            products.data?.content?.isEmpty == true
        ? SliverToBoxAdapter(
            child: Column(
              children: [
                verticalSpace(30),
                Image.asset(
                  "assets/images/Khaby-Lame-PNG-Image.png",
                  height: 250.h,
                  width: 250.w,
                ),
                verticalSpace(16),
                Center(
                  child: Text(
                    "No products found\nplease try again .......",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )
        : ProductsListView(
            content: products.data?.content ?? [],
          );
  }

  Widget setupFailure(message) {
    return SliverToBoxAdapter(
      child: Center(child: Text(message, style: TextStyle(color: Colors.red))),
    );
  }
}
