import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/products_response_model.dart';
import 'out_of_stock_container.dart';

class ProductsFancyImage extends StatelessWidget {
  final Content? content;
  const ProductsFancyImage({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FancyShimmerImage(
          imageUrl:
              "https://res.cloudinary.com/dw4e01qx8/f_auto,q_auto/images/mi1enckymudqw9jzmkna",
          width: MediaQuery.sizeOf(context).width,
          height: 200.h,
          boxFit: BoxFit.fill,
          shimmerBaseColor: Colors.grey[300]!,
          shimmerHighlightColor: Colors.grey[100]!,
          shimmerBackColor: Colors.grey[100]!,
          errorWidget: const Center(child: Icon(Icons.error)),
          alignment: Alignment.center,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r)),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        OutOfStockContainer(content: content,),
      ],
    );
  }
}
