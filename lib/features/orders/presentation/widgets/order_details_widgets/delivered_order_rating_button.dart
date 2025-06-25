import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';

import '../../../../../core/routing/router_observer.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import '../../../data/models/order_details_response_model.dart';

class DeliveredOrderRatingButton extends StatelessWidget {
  final OrderDetailsResponseModel orderDetails;

  const DeliveredOrderRatingButton({
    super.key,
    required this.orderDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppCustomButton(
        textButton: "Rate",
        btnWidth: 143.w,
        btnHeight: 50.h,
        onPressed: () {
          context.pushNamed(
            Routes.productsRatingScreen,
            arguments: {
              "deliveryAddress": orderDetails.data.deliveryAddress,
              "products": orderDetails.data.orderDetails.map((e) => e.product.toJson()).toList(),
            },
          );

          logger.i(
            "Navigating to ProductsRatingScreen with deliveryAddress: ${orderDetails.data.deliveryAddress} and products: ${orderDetails.data.orderDetails.map((e) => e.product.name).join(', ')}",
          );
        },
      ),
    );
  }
}
