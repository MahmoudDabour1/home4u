import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/products/presentation/widgets/products_custom_color_container.dart';
import 'package:home4u/features/products/presentation/widgets/products_custom_row_wigdet.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_custom_icon_button.dart';
import '../../../../locale/app_locale.dart';

class ProductShimmerWidget extends StatelessWidget {
  const ProductShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ProductShimmerItem();
        },
        childCount: 5,
      ),
    );
  }
}

class ProductShimmerItem extends StatelessWidget {
  const ProductShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.5,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackColor.withValues(alpha: 0.1),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Skeletonizer(
                  enabled: true,
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.211,
                    width: double.infinity.w,
                  ),
                ),
                verticalSpace(16),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 7,
                      children: [
                        Skeletonizer(
                          enabled: true,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Modern l-Shaped Sofa",
                                style: AppStyles.font16BlackLight,
                              ),
                              Row(
                                children: [
                                  AppCustomIconButton(
                                    onPressed: () {},
                                    image: AppAssets.editIconSvg,
                                  ),
                                  AppCustomIconButton(
                                    onPressed: () {},
                                    image: AppAssets.deleteIconSvg,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Skeletonizer(
                          enabled: true,
                          child: ProductsCustomRowWidget(
                            title: "-اثاث Furniture",
                            iconImage: AppAssets.furnitureSvg,
                          ),
                        ),
                        Skeletonizer(
                          enabled: true,
                          child: ProductsCustomRowWidget(
                            title: "\$150.0",
                            iconImage: AppAssets.priceSvg,
                            textStyle: AppStyles.font16BlueMedium,
                          ),
                        ),
                        Skeletonizer(
                          enabled: true,
                          child: ProductsCustomRowWidget(
                            title: "${AppLocale.stock}: 100",
                            iconImage: AppAssets.stockSvg,
                          ),
                        ),
                        Skeletonizer(
                          enabled: true,
                          child: Text("${AppLocale.dimensions}:180*180*180cm",
                              style: AppStyles.font16GrayLight),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                //TODO: Refactor this code to add colors shimmer
                                Row(
                                  children: List.generate(4, (index) {
                                    return Skeletonizer(
                                      enabled: true,
                                      child: Padding(
                                        padding:  EdgeInsets.all(8.0.r),
                                        child: ProductsCustomColorContainer(
                                            color: Colors.transparent),
                                      ),
                                    );
                                  }),
                                ),
                                AppCustomIconButton(
                                  image: AppAssets.arrowRightBlackSvg,
                                  width: 15.w,
                                  height: 15.h,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Skeletonizer(
                                  enabled: true,
                                  child: Text(
                                    '3.5',
                                    style: AppStyles.font14BlackLight,
                                  ),
                                ),
                                horizontalSpace(4),
                                Icon(
                                  Icons.star,
                                  color: AppColors.yellowColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                        // verticalSpace(4),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(16),
        ],
      ),
    );
  }
}
