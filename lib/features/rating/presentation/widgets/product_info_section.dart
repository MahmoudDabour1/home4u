import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/rating/presentation/widgets/product_text_info.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/fancy_image.dart';
import '../../../orders/data/models/order_details_response_model.dart';

class ProductInfoSection extends StatelessWidget {
  final String deliveryAddress;
  final Product product;

  const ProductInfoSection({
    super.key,
    required this.deliveryAddress,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FancyImage(
          imagePath: ApiConstants.getImageBaseUrl(product.imagePath),
          width: 100.w,
          height: 100.h,
          borderRadiusGeometry: BorderRadius.circular(8.0),
        ),
        horizontalSpace(16),
        Expanded(
          child: ProductTextInfo(
            productName: product.name,
            deliveryAddress: deliveryAddress,
          ),
        ),
      ],
    );
  }
}
