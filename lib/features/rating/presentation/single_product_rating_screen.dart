import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/helpers/helper_methods.dart';
import 'package:home4u/core/helpers/shared_pref_keys.dart';
import 'package:home4u/features/auth/widgets/auth_welcome_data.dart';
import 'package:home4u/features/rating/logic/product_rating/product_rating_state.dart';
import 'package:home4u/features/rating/presentation/widgets/feedback_success_dialog.dart';
import 'package:home4u/features/rating/presentation/widgets/product_info_section.dart';
import 'package:home4u/features/rating/presentation/widgets/product_rating_info_section.dart';
import 'package:home4u/features/rating/presentation/widgets/product_rating_submit_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/spacing.dart';
import '../../orders/data/models/order_details_response_model.dart';
import '../logic/product_rating/product_rating_cubit.dart';

class SingleProductRatingScreen extends StatelessWidget {
  final String deliveryAddress;
  final Product product;

  const SingleProductRatingScreen({
    super.key,
    required this.deliveryAddress,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductRatingCubit, ProductRatingState>(
      listener: (context, state) {
        if (state is InsertProductRatingSuccess) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const FeedbackSuccessDialog(),
          );
        } else if (state is InsertProductRatingFailure) {
          showToast(message: state.error, isError: true);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: context.read<ProductRatingCubit>().formKey,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AuthWelcomeData(
                      headText: "Product Preview",
                      subText: "",
                    ),
                    verticalSpace(16),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                      child: ProductInfoSection(
                        deliveryAddress: deliveryAddress,
                        product: product,
                      ),
                    ),
                    verticalSpace(24),
                    const ProductRatingInfoSection(),
                    ProductRatingSubmitButton(
                      productId: product.id,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
