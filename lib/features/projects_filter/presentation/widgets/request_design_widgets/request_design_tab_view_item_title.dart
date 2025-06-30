import 'package:flutter/material.dart';

import '../../../../../core/theming/app_styles.dart';

class RequestDesignTabViewItemTitle extends StatelessWidget {
  final String unitType;
  final num unitArea;

  const RequestDesignTabViewItemTitle(
      {super.key, required this.unitType, required this.unitArea});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Requesting a design for your house ($unitType) ${unitArea.toString()} m',
      style: AppStyles.font16BlackMedium,
    );
  }
}
