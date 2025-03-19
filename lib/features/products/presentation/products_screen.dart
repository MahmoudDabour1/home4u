import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/features/products/logic/products_cubit.dart';
import 'package:home4u/features/products/presentation/widgets/drawer/products_drawer.dart';
import 'package:home4u/features/products/presentation/widgets/filter/products_filter_button.dart';
import 'package:home4u/features/products/presentation/widgets/products_bloc_builder.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../core/routing/router_observer.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/widgets/app_custom_search_text_field.dart';
import '../../../core/widgets/business_header_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts().then((value) {
      context.read<ProductsCubit>().getBusinessConfig();
    });
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  void _scrollListener() {
    final cubit = context.read<ProductsCubit>();

    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent * 0.7 &&
        !cubit.hasReachedMax) {
      cubit.getProducts();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
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
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Builder(
              builder: (context) => BusinessHeaderWidget(
                headerTitle: AppLocale.products.getString(context),
                headerIcon: AppAssets.productWhiteSvg,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
                left: 24.w, right: 24.w, top: 16.h, bottom: 32.h),
            sliver: SliverToBoxAdapter(
              child: Row(
                spacing: 16.w,
                children: [
                  Expanded(
                    child: AppCustomSearchTextField(
                      controller:
                          context.read<ProductsCubit>().searchController,
                      onChanged: (value) {
                        context
                            .read<ProductsCubit>()
                            .getProducts(isRefresh: true);
                      },
                    ),
                  ),
                  ProductsFilterButton(),
                ],
              ),
            ),
          ),
          ProductsBlocBuilder()
        ],
      ),
    );
  }
}
