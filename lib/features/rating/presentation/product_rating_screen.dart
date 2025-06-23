import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/helpers/helper_methods.dart';
import 'package:home4u/core/helpers/shared_pref_keys.dart';
import 'package:home4u/features/auth/widgets/auth_welcome_data.dart';
import 'package:home4u/features/rating/logic/product_rating/product_rating_state.dart';
import 'package:home4u/features/rating/presentation/widgets/feedback_success_dialog.dart';
import 'package:home4u/features/rating/presentation/widgets/product_info_section.dart';
import 'package:home4u/features/rating/presentation/widgets/product_is_rated_before_widget.dart';
import 'package:home4u/features/rating/presentation/widgets/product_rating_info_section.dart';
import 'package:home4u/features/rating/presentation/widgets/product_rating_submit_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/spacing.dart';
import '../../orders/data/models/order_details_response_model.dart';
import '../logic/product_rating/product_rating_cubit.dart';

class ProductRatingScreen extends StatefulWidget {
  final String deliveryAddress;
  final Product product;

  const ProductRatingScreen({
    super.key,
    required this.deliveryAddress,
    required this.product,
  });

  @override
  State<ProductRatingScreen> createState() => _ProductRatingScreenState();
}

class _ProductRatingScreenState extends State<ProductRatingScreen> {
  @override
  void initState() {
    super.initState();
    checkIfProductAlreadyRated();
  }

  void checkIfProductAlreadyRated() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt(SharedPrefKeys.userId) ?? 0;
    context
        .read<ProductRatingCubit>()
        .checkIfProductRated(widget.product.id, userId);
  }

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
        final isRated = state is CheckIfProductRatedSuccess && state.isRated;

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
                        deliveryAddress: widget.deliveryAddress,
                        product: widget.product,
                      ),
                    ),
                    verticalSpace(24),
                    if (state is CheckIfProductRatedLoading)

                      ///ToDo : Shimmer
                      const Center(child: CircularProgressIndicator())
                    else if (isRated)
                      const ProductIsRatedBeforeWidget()
                    else
                      Column(
                        children: [
                          const ProductRatingInfoSection(),
                          ProductRatingSubmitButton(
                              productId: widget.product.id),
                        ],
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
