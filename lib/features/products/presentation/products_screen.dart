import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/auth/widgets/auth_welcome_data.dart';
import 'package:home4u/features/products/presentation/widgets/products_drawer.dart';
import 'package:home4u/features/products/presentation/widgets/products_filter_button.dart';
import 'package:home4u/features/products/presentation/widgets/products_list_view.dart';

import '../../../core/theming/app_colors.dart';
import '../../../core/widgets/app_custom_search_text_field.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.containersColor,
      drawer: ProductsDrawer(selectedItem:DrawerItem.products ,),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: AuthWelcomeData(
              headText: 'Products',
              subText: '',
              isBackButton: false,
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
                    child: AppCustomSearchTextField(),
                  ),
                  ProductsFilterButton(),
                ],
              ),
            ),
          ),
          ProductsListView(),
        ],
      ),
    );
  }
}
