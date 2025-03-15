import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/fancy_image.dart';
import '../../../../../locale/app_locale.dart';

class ProductsDetailsShimmer extends StatelessWidget {
  const ProductsDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16.h,
      children: [
        CarouselSlider(
          items: [
            ...List.generate(3, (index) {
              return Skeletonizer(
                enabled: true,
                child: FancyImage(
                    width: MediaQuery.sizeOf(context).width,
                    imagePath: "ApiConstants.getImageBaseUrl"),
              );
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
        ),
        verticalSpace(26),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24).w,
          child: Column(
            spacing: 16.h,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductKeyValue(
                key: AppLocale.name.getString(context),
                value: "previewData.data.width",
              ),
              _buildProductKeyValue(
                key: AppLocale.description.getString(context),
                value:"previewData.data.width",
              ),
              _buildProductKeyValue(
                key: AppLocale.material.getString(context),
                value:"previewData.data.width",
              ),
              _buildProductKeyValue(
                key: AppLocale.dimensions.getString(context),
                value: "previewData.data.width",
              ),
              _buildProductKeyValue(
                key: AppLocale.baseUnit.getString(context),
                value: "previewData.data.width",
              ),
              Text("Colors && Stock", style: AppStyles.font16BlackBold),
              Wrap(
                spacing: 8.w,
                children: List.generate(6, (index) {
                  return Skeletonizer(
                    enabled: true,
                    child: Chip(
                      avatar: CircleAvatar(
                        radius: 16.r,
                        backgroundColor: _hexToColor('0D132C'),
                      ),
                      label: Text('40 pieces'),
                      backgroundColor: AppColors.whiteColor,
                    ),
                  );
                }),
              )
            ],
          ),
        ),
        verticalSpace(32),
      ],
    );
  }

  Color _hexToColor(String hex) {
    hex = hex.replaceFirst('#', '');
    return Color(int.parse('0xFF$hex'));
  }

  Widget _buildProductKeyValue({
    required String key,
    required String value,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$key:",
          style: AppStyles.font16BlackBold,
        ),
        Skeletonizer(
          enabled: true,
          child: Text(
            value,
            style: AppStyles.font16BlackLight,
          ),
        ),
      ],
    );
  }
}
