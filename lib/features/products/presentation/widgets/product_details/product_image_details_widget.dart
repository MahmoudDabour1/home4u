import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/networking/api_constants.dart';
import 'package:home4u/core/widgets/fancy_image.dart';

import '../../../../../core/routing/router_observer.dart';
import '../../../data/models/product_preview_response.dart';

class ProductImageDetailsWidget extends StatelessWidget {
  final ProductPreviewResponse previewData;

  const ProductImageDetailsWidget({super.key, required this.previewData});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        ...List.generate(previewData.data.imagePaths.length, (index) {
          return FancyImage(
            width: MediaQuery.sizeOf(context).width,
              imagePath: ApiConstants.getImageBaseUrl(
                  previewData.data.imagePaths[index].imagePath.toString()));
        }),
      ],
      options: CarouselOptions(
        height: 220.h,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.75,
      ),
    );
  }
}
