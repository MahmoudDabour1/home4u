import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_styles.dart';

class ServiceRowItem extends StatelessWidget {
  final String serviceKey;
  final String serviceValue;

  const ServiceRowItem(
      {super.key, required this.serviceKey, required this.serviceValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
      children: [
        Text(
          serviceKey,
          style: AppStyles.font16BlackMedium,
        ),
        Expanded(
          child: Text(
            serviceValue,
            style: AppStyles.font16BlackMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
