import 'package:flutter/material.dart';

import '../../../../../core/theming/app_styles.dart';

class AskTechnicalTabViewItemTitle extends StatelessWidget {
  final String projectName;

  const AskTechnicalTabViewItemTitle({
    super.key,
    required this.projectName,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      projectName,
      style: AppStyles.font16BlackMedium,
    );
  }
}
