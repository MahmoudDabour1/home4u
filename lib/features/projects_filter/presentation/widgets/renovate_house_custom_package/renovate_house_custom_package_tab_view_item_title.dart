import 'package:flutter/material.dart';

import '../../../../../core/theming/app_styles.dart';

class RenovateHouseCustomPackageTabViewItemTitle extends StatelessWidget {
  final String packageName;
  const RenovateHouseCustomPackageTabViewItemTitle({super.key,required this.packageName});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Finishing your house ($packageName)",
      style: AppStyles.font16BlackMedium,
    );
  }
}
