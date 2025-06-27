import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/utils/spacing.dart';

import '../../../../../core/networking/api_constants.dart';
import '../../../../../core/widgets/fancy_image.dart';

class CartProductDetailsScreenCarouselSlider extends StatefulWidget {
  const CartProductDetailsScreenCarouselSlider({
    super.key,
    required this.images,
    this.useFancyImage = false,
  });

  final List<String> images;
  final bool useFancyImage;

  @override
  State<CartProductDetailsScreenCarouselSlider> createState() =>
      _CartProductDetailsScreenCarouselSliderState();
}

class _CartProductDetailsScreenCarouselSliderState
    extends State<CartProductDetailsScreenCarouselSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.images.map((image) {
            if (widget.useFancyImage) {
              return FancyImage(
                width: MediaQuery.sizeOf(context).width,
                imagePath: ApiConstants.getImageBaseUrl(image),
                borderRadiusGeometry: BorderRadius.circular(10.r),
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
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
                setState(() {});
              });
            },
          ),
        ),
        verticalSpace(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.images.length,
            (index) {
              return Container(
                width: 10.w,
                height: 10.h,
                margin: EdgeInsets.symmetric(horizontal: 6.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 2.w,
                  ),
                  color: _currentIndex == index ? Colors.black : Colors.white,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
