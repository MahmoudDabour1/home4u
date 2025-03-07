import 'package:flutter/material.dart';
import 'package:home4u/features/exhibition/presentation/widgets/product_preview/product_images_preview_widget.dart';
import 'package:home4u/features/exhibition/presentation/widgets/product_preview/product_preview_data_content.dart';
import 'package:home4u/features/exhibition/presentation/widgets/product_preview/product_preview_header_widget.dart';
import 'package:home4u/features/exhibition/presentation/widgets/product_preview/product_submit_button.dart';

import '../../../core/utils/spacing.dart';

class ProductPreviewScreen extends StatelessWidget {
  const ProductPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductPreviewHeader(),
              verticalSpace(32),
              ProductImagesPreviewWidget(),
              verticalSpace(26),
              ProductPreviewDataContent(),
              verticalSpace(32),
              ProductSubmitButton(),
              verticalSpace(46),
            ],
          ),
        ),
      ),
    );
  }
}
