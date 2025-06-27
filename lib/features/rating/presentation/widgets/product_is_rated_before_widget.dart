import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/routing/routes.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';

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
                    onPressed: () =>
                        context.pushNamed(Routes.singleProductRatingScreen),
                    child:  Text(
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
