import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImagesPreviewWidget extends StatelessWidget {
  final List<File> images;

  const ProductImagesPreviewWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: images.map((imageFile) {
        return Container(
          margin: EdgeInsets.all(6.0).h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0).r,
            image: DecorationImage(
              image: FileImage(imageFile),
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(),
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
