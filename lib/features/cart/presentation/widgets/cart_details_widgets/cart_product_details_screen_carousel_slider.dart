import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/app_back_button.dart';

class CartProductDetailsScreenCarouselSlider extends StatelessWidget {
  const CartProductDetailsScreenCarouselSlider({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: [
            // ...List.generate(previewData.data.imagePaths.length, (index) {
            //   return FancyImage(
            //       width: MediaQuery.sizeOf(context).width,
            //       imagePath: ApiConstants.getImageBaseUrl(
            //           previewData.data.imagePaths[index].imagePath.toString()));
            // }),
            ...List.generate(
              7,
              (index) {
                return Image.asset(
                  images[index],
                  fit: BoxFit.fill,
                  width: MediaQuery.sizeOf(context).width,
                  height: 350.h,
                );
              },
            ),
          ],
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
