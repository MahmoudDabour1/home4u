import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        onPressed: () => _showProductsDialog(context),
      ),
    );
  }
  void _showProductsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text("Select Product to Rate"),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: orderDetails.data.orderDetails.length,
              separatorBuilder: (_, __) => Divider(),
              itemBuilder: (context, index) {
                final product = orderDetails.data.orderDetails[index];
                return ListTile(
                  title: Text(product.product.name),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(
                      context,
                      Routes.productRatingScreen,
                      arguments: {
                        "deliveryAddress": orderDetails.data.deliveryAddress,
                        "product": product.product,
                      },
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
