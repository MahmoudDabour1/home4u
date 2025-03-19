import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts().then((value) {
      context.read<ProductsCubit>().getBusinessConfig();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: AppColors.containersColor,
      drawer: ProductsDrawer(
        selectedItem: DrawerItem.products,
      ),
      body: CustomScrollView(
        slivers: [
          ProductsHeaderWidget(),
          ProductsSearchAndFilterRowWidget(),
          ProductsBlocBuilder()
        ],
      ),
    );
  }
}
