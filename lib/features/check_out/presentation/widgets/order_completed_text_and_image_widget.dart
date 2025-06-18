import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/theming/app_assets.dart';
class OrderCompletedTextAndImageWidget extends StatelessWidget {
  const OrderCompletedTextAndImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(43),
        Text(
          AppLocale.orderCompleted.getString(context),
          style: AppStyles.font20BlackMedium,
        ),
        verticalSpace(80),
        Center(
          child: SvgPicture.asset(
            AppAssets.bagSvg,
            fit: BoxFit.contain,
          ),
        ),
        verticalSpace(55),
        Center(
          child: Text(AppLocale.thankYouForYourPurchase.getString(context),
              textAlign: TextAlign.center, style: AppStyles.font14DarkBlueBold),
        ),
        verticalSpace(108),
      ],
    );
  }
}