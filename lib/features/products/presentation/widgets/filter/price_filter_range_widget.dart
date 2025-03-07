import 'package:flutter/material.dart';
import 'package:home4u/core/theming/app_colors.dart';

class PriceFilterRangeWidget extends StatelessWidget {
  final double minPrice;
  final double maxPrice;
  final void Function(RangeValues)? onChanged;

  const PriceFilterRangeWidget({
    super.key,
    required this.minPrice,
    required this.maxPrice,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
        values: RangeValues(minPrice, maxPrice),
        min: 0,
        max: 1000,
        divisions: 20,
        activeColor: AppColors.primaryColor,
        overlayColor:WidgetStateProperty.resolveWith((states)
    =>
    AppColors.whiteColor
    ),
    labels: RangeLabels(

    "\$${minPrice.toInt()}",
    "\$${maxPrice.toInt()}",
    ),
    onChanged:
    onChanged
    ,
    );
  }
}
