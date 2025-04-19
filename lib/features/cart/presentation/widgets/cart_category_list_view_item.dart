import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';


class CartCategoryListViewItem extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const CartCategoryListViewItem({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        spacing: 8.h,
        children: [
          Container(
            height: 44.h,
            width: 44.w,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primaryColor : Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.shopping_cart,
              color: isSelected ? AppColors.whiteColor : AppColors.primaryColor,
              size: 24.w,
            ),
          ),
          Text(
            'Item',
            // Replace with your cart item name
            style: AppStyles.font14BlackMedium,
          ),
        ],
      ),
    );
  }
}
