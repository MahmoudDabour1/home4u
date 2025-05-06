import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/networking/api_constants.dart';
import '../../../../../core/widgets/app_back_button.dart';
import '../../../../../core/widgets/fancy_image.dart';


class CartProductDetailsScreenCarouselSlider extends StatelessWidget {
  const CartProductDetailsScreenCarouselSlider({
    super.key,
    required this.images,
    this.useFancyImage = false,
  });

  final List<String> images;
  final bool useFancyImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: images.map((image) {
            if (useFancyImage) {
              return FancyImage(
                width: MediaQuery.sizeOf(context).width,
                imagePath: ApiConstants.getImageBaseUrl(image),
                borderRadiusGeometry: BorderRadius.zero,
              );
            } else {
              return Image.asset(
                image,
                fit: BoxFit.fill,
                width: MediaQuery.sizeOf(context).width,
                height: 350.h,
              );
            }
          }).toList(),
          options: CarouselOptions(
            height: 350.h,
            enlargeCenterPage: false,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.easeInOut,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            scrollDirection: Axis.horizontal,
            viewportFraction: 1,
          ),
        ),
        Positioned(
          left: 24.w,
          top: 24.h,
          child: AppBackButton(),
        ),
      ],
    );
  }
}
