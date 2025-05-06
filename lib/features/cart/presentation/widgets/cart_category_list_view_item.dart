import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';

class CartCategoryListViewItem extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String categoryName;

  const CartCategoryListViewItem({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 8.h,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Text(
            categoryName,
            style: AppStyles.font14BlackMedium.copyWith(
              color: isSelected ? Colors.white : AppColors.blackColor,
            ),
          ),
        ),
      ),
    );
  }
}
