import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/app_custom_button.dart';
import 'filter_image_and_name_widget.dart';
import 'filter_types_widget.dart';

class FilterContainerContent extends StatelessWidget {
  const FilterContainerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.r),
      child: Column(
        spacing: 16.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Finishing house apartment 90m",
            style: AppStyles.font16BlackLight,
          ),
          FilterImageAndNameWidget(),
          FilterTypesWidget(),
          AppCustomButton(
            textButton: "Fast delivery",
            btnWidth: 210.w,
            btnHeight: 35.h,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
