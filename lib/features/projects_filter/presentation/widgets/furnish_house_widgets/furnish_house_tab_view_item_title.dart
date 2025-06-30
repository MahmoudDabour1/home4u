import 'package:flutter/material.dart';

import '../../../../../core/theming/app_styles.dart';

class FurnishHouseTabViewItemTitle extends StatelessWidget {
  final String unitType;
  const FurnishHouseTabViewItemTitle({super.key, required this.unitType});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Furnishing your house ($unitType)",
      style: AppStyles.font16BlackMedium,
    );
  }
}
