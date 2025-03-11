import 'package:flutter/material.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/features/exhibition/presentation/widgets/product_preview/product_submit_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/app_rounded_back_button.dart';

class ProductPreviewButtons extends StatelessWidget {
  const ProductPreviewButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24).w,
      child: Row(
        spacing : 16.w,
        children: [
          AppRoundedBackButton(
            onPressed: () => context.pop(),
          ),
          Expanded(
            child: ProductSubmitButton(),
          ),
        ],
      ),
    );
  }
}
