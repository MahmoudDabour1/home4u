import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home4u/core/utils/spacing.dart';

import '../../../../../core/theming/app_styles.dart';

class MenuItem extends StatelessWidget {
  final String text;
  final String icon;
  void Function()? onTap;

   MenuItem(
      {super.key, required this.text, required this.icon,  required this.onTap});

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
