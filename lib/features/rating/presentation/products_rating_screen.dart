import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/rating/presentation/widgets/check_product_rating_bloc_builder.dart';
import 'package:home4u/features/rating/presentation/widgets/product_info_section.dart';

import '../../../core/utils/spacing.dart';
import '../../auth/widgets/auth_welcome_data.dart';
import '../../orders/data/models/order_details_response_model.dart';

class ProductsRatingScreen extends StatefulWidget {
  final String deliveryAddress;
  final List<Product> products;

  const ProductsRatingScreen({
    super.key,
    required this.deliveryAddress,
    required this.products,
  });

  @override
  State<ProductsRatingScreen> createState() => _ProductsRatingScreenState();
}

class _ProductsRatingScreenState extends State<ProductsRatingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const AuthWelcomeData(
                headText: "Rate Your Products",
                subText: "",
              ),
              verticalSpace(16),
              ListView.separated(
                itemBuilder: (context, index) {
                  final product = widget.products[index];
                  return Column(
                    children: [
                      ProductInfoSection(
                        deliveryAddress: widget.deliveryAddress,
                        product: product,
                      ),
                      const SizedBox(height: 8),
                      CheckProductRatingBlocBuilder(
                        productId: product.id,
                      ),
                    ],
                  );
                },
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemCount: widget.products.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
