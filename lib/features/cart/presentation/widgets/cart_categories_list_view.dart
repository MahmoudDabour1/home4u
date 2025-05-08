import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/cart/logic/cart_state.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_category_list_view_item.dart';
import 'package:home4u/features/products/data/models/business_config_model.dart';

import '../../../products/logic/products_cubit.dart';
import '../../../products/logic/products_state.dart';
import '../../logic/cart_cubit.dart';

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
  void initState() {
    super.initState();
    final cartCubit = context.read<CartCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (cartCubit.selectedBusinessType == null) {
        setState(() {
          selectedIndex = 0;
          selectedSubCategoryIndex = -1;
          filteredSubCategories = [];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit,CartState>(
      listener: (context, state) {
        if (state is ResetAllFilters) {
          setState(() {
            selectedIndex = 0;
            selectedSubCategoryIndex = -1;
            filteredSubCategories = [];
          });
        }
      },
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          final productsCubit = context.read<ProductsCubit>();
          final cartCubit = context.read<CartCubit>();

          final originalBusinessTypes = productsCubit.businessTypes ?? [];
          final businessTypeCategories =
              productsCubit.businessTypeCategories ?? [];

          ///Total as the first item
          final businessTypes = [
            BusinessType(id: null, name: "Total"),
            ...originalBusinessTypes,
          ];

          if (selectedIndex != 0) {
            final selectedId = businessTypes[selectedIndex].id;
            filteredSubCategories = businessTypeCategories
                .where((cat) => cat.businessType?.id == selectedId)
                .toList();
          } else {
            filteredSubCategories = [];
          }

        return Column(
          children: [
            /// Main Business Types
            SizedBox(
              height: 40.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: businessTypes.length,
                itemBuilder: (context, index) {
                  return CartCategoryListViewItem(
                    isSelected: selectedIndex == index,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        selectedSubCategoryIndex = -1;

                          final selectedCategory = businessTypes[index];
                          final selectedId = selectedCategory.id;

                          if (selectedId == null) {
                            cartCubit.selectedBusinessType = null;
                            cartCubit.selectedBusinessTypeCategory = null;
                            filteredSubCategories = [];
                          } else {
                            filteredSubCategories = businessTypeCategories
                                .where(
                                    (cat) => cat.businessType?.id == selectedId)
                                .toList();
                            cartCubit.selectedBusinessType = selectedId;
                            cartCubit.selectedBusinessTypeCategory = null;
                          }

                          cartCubit.getCartProducts(isRefresh: true);
                        });
                      },
                      categoryName: businessTypes[index].name ?? '',
                    );
                  },
                  separatorBuilder: (_, __) => SizedBox(width: 16.w),
                ),
              ),

            /// Main Sub-Categories
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
                            cartCubit.selectedBusinessTypeCategory = subCat.id;
                            cartCubit.getCartProducts(isRefresh: true);
                          });
                        },
                        categoryName: subCat.name ?? '',
                      );
                    },
                    separatorBuilder: (_, __) => SizedBox(width: 16.w),
                  ),
                ),
              ),
          ],
        );
      },),);
  }
}
