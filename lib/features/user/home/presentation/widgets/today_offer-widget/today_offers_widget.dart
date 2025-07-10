import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/routing/routes.dart';
import 'package:home4u/core/theming/app_assets.dart';

import '../../../../../../core/utils/spacing.dart';

class TodayOffersWidget extends StatefulWidget {
  const TodayOffersWidget({super.key});

  @override
  State<TodayOffersWidget> createState() => _TodayOffersWidgetState();
}

class _TodayOffersWidgetState extends State<TodayOffersWidget> {
  int currentCarouselIndex = 0;
  final List<String> carouselImages = [
    AppAssets.designYourRoomWithAi,
    AppAssets.furnishYourHomeImage,
    AppAssets.kitchensAndDressing,
    AppAssets.renovateYourHome,
    AppAssets.requestDesign,
    AppAssets.technical,
  ];

  final List<String> carouselNavigation = [
    Routes.requestDesignScreen,
    Routes.furnishYourHomeScreen,
    Routes.kitchenAndDressingScreen,
    Routes.renovateYourHouseScreen,
    Routes.requestDesignScreen,
    Routes.askTechnicalScreen,
  ];

  void _handleImageTap(int index) {
    context.pushNamed(carouselNavigation[index]);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Column(
      children: [
        CarouselSlider(
          items: [
            ...carouselImages.map((image) {
              return GestureDetector(
                onTap: () => _handleImageTap(carouselImages.indexOf(image)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0).r,
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            })
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
