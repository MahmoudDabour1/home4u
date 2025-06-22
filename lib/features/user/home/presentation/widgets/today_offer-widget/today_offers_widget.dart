import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_assets.dart';

import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../../locale/app_locale.dart';
import '../custom_see_all_row_widget.dart';

class TodayOffersWidget extends StatefulWidget {
  const TodayOffersWidget({super.key});

  @override
  State<TodayOffersWidget> createState() => _TodayOffersWidgetState();
}

class _TodayOffersWidgetState extends State<TodayOffersWidget> {
  int currentCarouselIndex = 0;
  final  List<String> carouselImages = [
    AppAssets.designYourRoomWithAi,
    AppAssets.designYourRoomWithAi,
    AppAssets.designYourRoomWithAi,
    AppAssets.designYourRoomWithAi,
    AppAssets.designYourRoomWithAi,
  ];

  void _handleImageTap(int index) {
    // Handle the tap event for the image at the given index
    // For example, you can navigate to a detailed view or show a dialog
    print('Image tapped at index: $index');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: [
            ...carouselImages.map((image) {
              return GestureDetector(
                onTap: ()=> _handleImageTap(carouselImages.indexOf(image)),
                child : Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0).r,
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            }).toList()
          ],
          options: CarouselOptions(
            height: 180.h,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.85,
            onPageChanged: (index, reason) {
              setState(() {
                currentCarouselIndex = index;
              });
            },
          ),
        ),
        verticalSpace(32),
      ],
    );
  }
}
