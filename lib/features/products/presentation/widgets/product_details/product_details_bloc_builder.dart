import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/features/products/logic/products_cubit.dart';
import 'package:home4u/features/products/logic/products_state.dart';
import 'package:home4u/features/products/presentation/widgets/product_details/product_details_data_content.dart';
import 'package:home4u/features/products/presentation/widgets/product_details/product_image_details_widget.dart';

import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_loading_indicator.dart';

class ProductDetailsBlocBuilder extends StatelessWidget {
  const ProductDetailsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      buildWhen: (previous, current) =>
          current is GetProductPreviewLoading ||
          current is GetProductPreviewSuccess ||
          current is GetProductPreviewFailure,
      builder: (context, state) {
        return state.maybeWhen(
          getProductPreviewLoading: () => setupLoading(),
          getProductPreviewSuccess: (productDetails) {
            return setupSuccessWidget(productDetails);
          },
          getProductPreviewFailure: (errorHandler) => setupError(),
          orElse: () {
            return SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setupSuccessWidget(productDetails) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductImageDetailsWidget(
          previewData: productDetails,
        ),
        verticalSpace(26),
        ProductDetailsDataContent(
          previewData: productDetails,
        ),
        verticalSpace(32),
      ],
    );
  }

  Widget setupError() {
    return SizedBox.shrink();
  }

  Widget setupLoading() {
    return Center(
      child: AppCustomLoadingIndicator(
        loadingColor: AppColors.secondaryColor,
      ),
    );
  }
}
