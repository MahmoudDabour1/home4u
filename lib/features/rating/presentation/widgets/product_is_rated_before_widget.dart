import 'package:flutter/material.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/routing/routes.dart';

import '../../../orders/data/models/order_details_response_model.dart';

class ProductIsRatedBeforeWidget extends StatelessWidget {
  final bool isRatedBefore;
  final double? ratingValue;

  const ProductIsRatedBeforeWidget({
    super.key,
    required this.isRatedBefore,
    this.ratingValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Your Feedback",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => context.pushNamed(
                        Routes.singleProductRatingScreen,
                        arguments: {
                          "deliveryAddress": "Mansoura, Egypt",
                          "product": Product(
                              id: 128,
                              name: "Elfeshawy",
                              imagePath:
                                  "./uploads/business/products/119_854dd082-45c3-4e39-8987-5c08fe8e5815.jpg"),
                        }),
                    child: Text(
                      isRatedBefore ? "Edit Review" : "Add Review",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              isRatedBefore
                  ? Row(
                      children: [
                        const Text("Product Rating: "),
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        Text(
                          ratingValue?.toStringAsFixed(1) ?? "-",
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    )
                  : const Text(
                      "You have not rated this product yet.",
                      style: TextStyle(fontSize: 14),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
