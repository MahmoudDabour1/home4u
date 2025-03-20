import 'package:flutter/material.dart';
import 'package:home4u/features/exhibition/presentation/widgets/product_preview/product_images_preview_widget.dart';
import 'package:home4u/features/exhibition/presentation/widgets/product_preview/product_preview_buttons.dart';
import 'package:home4u/features/exhibition/presentation/widgets/product_preview/product_preview_data_content.dart';
import 'package:home4u/features/exhibition/presentation/widgets/product_preview/product_preview_header_widget.dart';

import '../../../core/utils/spacing.dart';

class ProductPreviewScreen extends StatelessWidget {
  final Map<String, dynamic> previewData;

  const ProductPreviewScreen({super.key, required this.previewData});

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
              ProductImagesPreviewWidget(images: previewData['images']),
              verticalSpace(26),
              ProductPreviewDataContent(previewData: previewData),
              verticalSpace(32),
              ProductPreviewButtons(),
              verticalSpace(46),
            ],
          ),
        ),
      ),
    );
  }
}
