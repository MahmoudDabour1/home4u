import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../locale/app_locale.dart';

class TotalPriceRow extends StatelessWidget {
  final double total;

  const TotalPriceRow({
    super.key,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            AppLocale.total.getString(context),
            style: AppStyles.font16BlackLight,
          ),
        ),
        Text(
          "\$ ${total.toStringAsFixed(2)}",
          style: AppStyles.font20BlackMedium,
        ),
      ],
    );
  }
}