import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/networking/api_constants.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_details_widgets/plus_and_minus_controll_buttons.dart';

import '../../../data/models/cart_item_model.dart';

class OrderDetailsItem extends StatelessWidget {
  final CartItemModel cartItem;
  final VoidCallback onRemove;
  final Function(int) onQuantityChanged;

  const OrderDetailsItem({
    super.key,
    required this.cartItem,
    required this.onRemove,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Image.network(
            // Replace with asset if needed
            ApiConstants.getImageBaseUrl(cartItem.product!.imagePath! ?? '') ??
                '', // Ensure it’s not null
            width: 100.w,
            height: 100.h,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.image),
          ),
        ),
        horizontalSpace(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cartItem.product.name ?? 'No name',
              style: AppStyles.font16BlackMedium,
            ),
            verticalSpace(4.h),
            Text(
              '${cartItem.product.price ?? 0} EGP',
              style: AppStyles.font16BlackBold,
            ),
            PlusAndMinusControllerButtons(),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: onRemove,
          child: Container(
            width: 24.w,
            height: 24.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                width: 1.w,
              ),
            ),
            child: Icon(
              Icons.close,
              size: 16.w,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
