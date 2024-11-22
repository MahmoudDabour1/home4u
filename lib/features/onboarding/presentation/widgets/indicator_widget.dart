import 'package:flutter/cupertino.dart';
import 'package:home4u/core/utils/spacing.dart';

import 'custom_indicator.dart';

class IndicatorWidget extends StatelessWidget {
  final int index;

  const IndicatorWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIndicator(active: index == 0),
        horizontalSpace(5),
        CustomIndicator(active: index == 1),
        horizontalSpace(5),
        CustomIndicator(active: index == 2),
        horizontalSpace(5),
        CustomIndicator(active: index == 3),
      ],
    );
  }
}
