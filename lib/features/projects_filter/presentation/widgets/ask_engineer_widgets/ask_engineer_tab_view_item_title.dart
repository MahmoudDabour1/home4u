import 'package:flutter/material.dart';

import '../../../../../core/theming/app_styles.dart';

class AskEngineerTabViewItemTitle extends StatelessWidget {
  final String projectName;

  const AskEngineerTabViewItemTitle({super.key, required this.projectName});

  @override
  Widget build(BuildContext context) {
    return Text(
      projectName,
      style: AppStyles.font16BlackMedium,
    );
  }
}
