import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home4u/core/utils/spacing.dart';

import '../theming/app_styles.dart';

class AppCustomMenuItem extends StatelessWidget {
  const AppCustomMenuItem({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });

  final VoidCallback onTap;
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Align(child: SvgPicture.asset(icon)),
          horizontalSpace(8),
          Text(
            text,
            style: AppStyles.font16BlackMedium,
          ),
        ],
      ),
    );
  }
}
