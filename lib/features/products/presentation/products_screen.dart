import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:home4u/core/routing/router_observer.dart';
import 'package:home4u/core/utils/app_constants.dart';
import 'package:home4u/features/products/data/models/products_response_model.dart';
import 'package:home4u/features/products/logic/products_cubit.dart';
import 'package:home4u/features/products/presentation/widgets/drawer/products_drawer.dart';
import 'package:home4u/features/products/presentation/widgets/products_bloc_builder.dart';
import 'package:home4u/features/products/presentation/widgets/products_header_widget.dart';
import 'package:home4u/features/products/presentation/widgets/products_search_and_filter_row_widget.dart';

import '../../../core/theming/app_colors.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen>
    with AutomaticKeepAliveClientMixin {
  var data;
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts().then((value) {
      context.read<ProductsCubit>().getBusinessConfig();
    });
    cachedData();
  }
  void cachedData()async{
    var productsBox = await Hive.openBox<ProductsResponseModel>(kProductsBox);
    var products = productsBox.get(kProductsData);
  data = products;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: AppColors.containersColor,
      drawer: ProductsDrawer(
        selectedItem: DrawerItem.products,
      ),
      body: RefreshIndicator(
        backgroundColor: AppColors.primaryColor,
        color: AppColors.whiteColor,
        onRefresh: () => _onRefresh(context),
        displacement: 100.h,
        child: CustomScrollView(
          slivers: [
            ProductsHeaderWidget(),
            ProductsSearchAndFilterRowWidget(),
            ProductsBlocBuilder()
          ],
        ),
      ),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    await Future.delayed(Duration(seconds: 1), () {
      context.read<ProductsCubit>().getProducts();
      context.read<ProductsCubit>().searchController.clear();
    });
  }
}
