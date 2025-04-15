import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_category_list_view_item.dart';

class CartCategoriesListView extends StatefulWidget {
  const CartCategoriesListView({super.key});

  @override
  State<CartCategoriesListView> createState() => _CartCategoriesListViewState();
}

class _CartCategoriesListViewState extends State<CartCategoriesListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return CartCategoryListViewItem(
            isSelected: selectedIndex == index,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 16.w,
          );
        },
      ),
    );
  }
}
