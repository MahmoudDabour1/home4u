import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../../core/widgets/app_custom_button.dart';
import '../../../../../../locale/app_locale.dart';
import '../custom_see_all_row_widget.dart';

class TodayOffersWidget extends StatefulWidget {
  const TodayOffersWidget({super.key});

  @override
  State<TodayOffersWidget> createState() => _TodayOffersWidgetState();
}

class _TodayOffersWidgetState extends State<TodayOffersWidget> {
  int currentCarouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(32),
        CustomSeeAllRowWidget(
          text: AppLocale.todayOffers.getString(context),
          onPressed: () {},
        ),
        verticalSpace(16),
        CarouselSlider(
          items: [
            ...List.generate(5, (index) {
              return Container(
                width: double.infinity.w,
                height: MediaQuery.sizeOf(context).height * 0.282,
                decoration: BoxDecoration(
                  color: AppColors.scaffoldBusinessBackgroundColor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpace(21),
                          Text(
                            AppLocale.specialOffers.getString(context),
                            style: AppStyles.font16BlackLight,
                          ),
                          verticalSpace(8),
                          Text(
                            '${AppLocale.getSpecialOffer.getString(context)} 20',
                            style: AppStyles.font16BlackBold,
                          ),
                          verticalSpace(30),
                          Expanded(
                            child: AppCustomButton(
                                textButton: AppLocale.claim.getString(context),
                                btnWidth: 76.w,
                                btnHeight: 25.h,
                                onPressed: () {}),
                          ),
                          verticalSpace(20),
                        ],
                      ),
                      horizontalSpace(8),
                      // Spacer(),
                      Expanded(
                          child: Image.asset(
                        "assets/images/girl.png",
                            height: MediaQuery.sizeOf(context).height,
                            fit: BoxFit.fill,
                      )),
                    ],
                  ),
                ),
              );
            }),
          ],
          options: CarouselOptions(
            height: 180.h,
            scrollDirection: Axis.horizontal,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                currentCarouselIndex = index;
              });
            },
          ),
        ),
        verticalSpace(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(5, (index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: CircleAvatar(
                  radius: 8.r,
                  backgroundColor: currentCarouselIndex == index
                      ? AppColors.secondaryColor
                      : AppColors.grayColor,
                ),
              );
            })
          ],
        ),
        verticalSpace(32),
      ],
    );
  }
}
