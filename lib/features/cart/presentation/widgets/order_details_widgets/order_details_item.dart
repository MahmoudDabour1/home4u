import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/networking/api_constants.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/core/widgets/fancy_image.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_details_widgets/plus_and_minus_controll_buttons.dart';

import '../../../data/models/cart_item_model.dart';
import '../../../logic/cart_cubit.dart';

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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FancyImage(
            imagePath: ApiConstants.getImageBaseUrl(cartItem.product.imagePath! ?? ''),
            height: 100.h,
            width: 100.w,
            borderRadiusGeometry: BorderRadius.circular(8.r),
          ),
          horizontalSpace(8),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 200.w),
                  child: AutoSizeText(
                    cartItem.product.name ?? 'No name',
                    style: AppStyles.font16BlackMedium,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                verticalSpace(4.h),
                Text(
                  '${cartItem.product.price ?? 0} EGP',
                  style: AppStyles.font16BlackBold,
                ),
                IntrinsicWidth(
                  child: PlusAndMinusControllerButtons(
                    initialQuantity: cartItem.quantity,
                    onQuantityChanged: (newQuantity) {
                      context.read<CartCubit>()
                          .updateQuantity(cartItem.product, newQuantity);
                    },
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: InkWell(
              onTap: onRemove,
              splashColor: Colors.transparent,
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
          ),
        ],
      ),
    );
  }
}