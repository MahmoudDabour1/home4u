import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/core/theming/app_styles.dart';

import '../../../data/models/orders_response_model.dart';

class OrderDetailsStatusCard extends StatelessWidget {
  final OrderStatusCode orderStatusCode;

  const OrderDetailsStatusCard({
    super.key,
    required this.orderStatusCode,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: 20.0,
            top: 10.0,
            bottom: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                getStatusTitle(),
                style: AppStyles.font16WhiteBold,
              ),
              AutoSizeText(
                getStatusSubtitle(),
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsetsDirectional.only(
            end: 20.0,
            top: 10.0,
            bottom: 10.0,
          ),
          child: SvgPicture.asset(
            getStatusImage(),
            width: 50.w,
            height: 50.h,
          ),
        ),
      ],
    );
  }

  String getStatusTitle() {
    switch (orderStatusCode) {
      case OrderStatusCode.DELIVERED:
        return "Your order is delivered";
      case OrderStatusCode.PENDING:
        return "Your order is on the way";
      case OrderStatusCode.CANCELED:
        return "Your order is cancelled";
    }
  }

  String getStatusSubtitle() {
    switch (orderStatusCode) {
      case OrderStatusCode.DELIVERED:
        return "Rate product to get 5 points for collect.";
      case OrderStatusCode.PENDING:
        return "Your order will be delivered soon.";
      case OrderStatusCode.CANCELED:
        return "Your order has been cancelled.";
    }
  }

  String getStatusImage() {
    switch (orderStatusCode) {
      case OrderStatusCode.DELIVERED:
        return AppAssets.onTheWaySvg;
      case OrderStatusCode.PENDING:
        return AppAssets.giftSvg;
      case OrderStatusCode.CANCELED:
        return AppAssets.onTheWaySvg;
    }
  }
}
