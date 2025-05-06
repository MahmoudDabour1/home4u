import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_category_list_view_item.dart';
import 'package:home4u/features/products/data/models/business_config_model.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../products/logic/products_cubit.dart';
import '../../../products/logic/products_state.dart';

class CartCategoriesListView extends StatefulWidget {
  const CartCategoriesListView({super.key});

  @override
  State<CartCategoriesListView> createState() => _CartCategoriesListViewState();
}

class _CartCategoriesListViewState extends State<CartCategoriesListView> {
  int selectedIndex = 0;
  int selectedSubCategoryIndex = -1;
  List<BusinessType> filteredSubCategories = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        final cubit = context.read<ProductsCubit>();
        final businessTypes = cubit.businessTypes ?? [];
        final businessTypeCategories = cubit.businessTypeCategories ?? [];

        // Filter sub-categories for selected main category
        if (filteredSubCategories.isEmpty && businessTypes.isNotEmpty) {
          final selectedId = businessTypes[selectedIndex].id;
          filteredSubCategories = businessTypeCategories
              .where((cat) => cat.businessType?.id == selectedId)
              .toList();
        }

        return Column(
          children: [
            // Main Categories
            SizedBox(
              height: 40.h,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: businessTypes.length,
                itemBuilder: (context, index) {
                  return CartCategoryListViewItem(
                    isSelected: selectedIndex == index,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        selectedSubCategoryIndex = -1; // Reset sub-category
                        final selectedId = businessTypes[index].id;
                        filteredSubCategories = businessTypeCategories
                            .where((cat) =>
                        cat.businessType?.id == selectedId)
                            .toList();
                      });
                    },
                    categoryName: businessTypes[index].name ?? '',
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(width: 16.w),
              ),
            ),

            // Sub-Categories
            if (filteredSubCategories.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: SizedBox(
                  height: 40.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: filteredSubCategories.length,
                    itemBuilder: (context, index) {
                      final subCat = filteredSubCategories[index];
                      return CartCategoryListViewItem(
                        isSelected: selectedSubCategoryIndex == index,
                        onTap: () {
                          setState(() {
                            selectedSubCategoryIndex = index;
                            // Optional: perform filtering or other logic here
                          });
                        },
                        categoryName: subCat.name ?? '',
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(width: 16.w),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
