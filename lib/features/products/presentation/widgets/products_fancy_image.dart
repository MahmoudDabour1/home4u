import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/networking/api_constants.dart';
import 'package:home4u/core/widgets/fancy_image.dart';

import '../../data/models/products_response_model.dart';
import 'out_of_stock_container.dart';

class ProductsFancyImage extends StatelessWidget {
  final Content? content;

  const ProductsFancyImage({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FancyImage(
          imagePath: ApiConstants.getImageBaseUrl(content!.imagePath??''),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * 0.211,
          borderRadiusGeometry: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
        ),
        OutOfStockContainer(
          content: content,
        ),
      ],
    );
  }
}
