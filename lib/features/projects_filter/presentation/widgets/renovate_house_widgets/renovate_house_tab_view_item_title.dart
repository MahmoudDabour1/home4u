import 'package:flutter/material.dart';

import '../../../../../core/theming/app_styles.dart';

class RenovateHouseTabViewItemTitle extends StatelessWidget {
  final String unitType;
  final num unitArea;

  const RenovateHouseTabViewItemTitle({
    super.key,
    required this.unitType,
    required this.unitArea,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Finishing your house ($unitType) ${unitArea.toString()} m",
      style: AppStyles.font16BlackMedium,
    );
  }
}
