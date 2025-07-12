import 'package:auto_size_text/auto_size_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/networking/api_constants.dart';
import 'package:home4u/core/widgets/fancy_image.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_details_widgets/animated_toggle_row.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../cart/logic/cart_cubit.dart';

class ScrollContainerWidget extends StatefulWidget {
  final String image;
  final String title;
  final String starCount;
  final String ratingCount;
  final String price;
  final String rankBySales;
  final int? productId;
  final bool? isVerticalScroll;
  final String numberOfSales;
  final dynamic product;

  const ScrollContainerWidget({
    super.key,
    required this.image,
    required this.title,
    required this.starCount,
    required this.ratingCount,
    required this.price,
    required this.rankBySales,
    this.productId,
    this.isVerticalScroll = false,
    required this.numberOfSales,
    required this.product,
  });

  @override
  State<ScrollContainerWidget> createState() => _ScrollContainerWidgetState();
}

class _ScrollContainerWidgetState extends State<ScrollContainerWidget> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          Routes.cartProductDetailsScreen,
          arguments: widget.productId,
        );
      },
      child: Container(
        width: 160.w,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grayColor, width: 1),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Container(
                height: 150.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.filledGrayColor,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    topRight: Radius.circular(8.r),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.r),
                        child: FancyShimmerImage(
                          imageUrl:
                          ApiConstants.getImageBaseUrl(widget.image),
                          height: MediaQuery.sizeOf(context).height - 16.w,
                          width: MediaQuery.sizeOf(context).width - 16.w,
                          boxFit: BoxFit.cover,
                          shimmerBaseColor: Colors.grey[300]!,
                          shimmerHighlightColor: Colors.grey[100]!,
                          shimmerBackColor: Colors.grey[100]!,
                          errorWidget: const Center(child: Icon(Icons.error)),
                          alignment: Alignment.center,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              // borderRadius: BorderRadius.circular(16.r),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),



                        // Image.network(
                        //   '${ApiConstants.apiBaseUrl}/${widget.image}',
                        //   height: MediaQuery.sizeOf(context).height - 16.w,
                        //   width: MediaQuery.sizeOf(context).width - 16.w,
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                      Positioned(
                        top: 4.h,
                        right: 4.w,
                        child: Container(
                          width: 35.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColors.whiteColor,
                          ),
                          child: Center(
                            child: IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: isFavorite
                                    ? Colors.red
                                    : AppColors.grayColor,
                                size: 20.h,
                              ),
                              onPressed: () {
                                setState(() {
                                  isFavorite = !isFavorite;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 4.h,
                        right: 4.w,
                        child: Container(
                          width: 35.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColors.whiteColor,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.shopping_cart_checkout_sharp,
                              size: 24.h,
                            ),
                            onPressed: () {
                              context
                                  .read<CartCubit>()
                                  .addToCart(widget.product, context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    widget.title,
                    style: AppStyles.font16BlackMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  verticalSpace(8),
                  widget.isVerticalScroll == true
                      ? Row(
                          children: [
                            ratingContainer(),
                            Spacer(),
                            priceRichText(context),
                          ],
                        )
                      : SizedBox.shrink(),
                  if (widget.isVerticalScroll == false) ...[
                    ratingContainer(),
                    verticalSpace(8),
                    priceRichText(context),
                  ],
                  verticalSpace(8),
                  AnimatedToggleRow(
                      textOne: "#${widget.rankBySales}",
                      textTwo: widget.numberOfSales,
                      iconSize: 20.r,
                      textStyle: AppStyles.font14BlackMedium),
                  verticalSpace(8),
                  widget.isVerticalScroll == true
                      ? verticalSpace(16)
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget priceRichText(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: AppLocale.egp.getString(context),
        style: AppStyles.font16BlackLight,
        children: [
          TextSpan(
            text: widget.price,
            style: AppStyles.font16BlackBold,
          ),
        ],
      ),
    );
  }

  Widget ratingContainer() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.filledGrayColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.starCount,
              style: AppStyles.font14BlackMedium,
            ),
            Icon(
              Icons.star,
              color: Colors.yellow,
              size: 20.r,
            ),
            horizontalSpace(4),
            Text(
              '(${widget.ratingCount})',
              style: AppStyles.font16GrayLight.copyWith(
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
