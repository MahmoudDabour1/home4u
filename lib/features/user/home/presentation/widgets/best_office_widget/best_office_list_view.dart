import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/spacing.dart';
import '../scroll_container_widget.dart';

class BestOfficeListView extends StatelessWidget {
  const BestOfficeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => horizontalSpace(8.w),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ScrollContainerWidget(
            image: "assets/images/profile_back_image.png",
            title: "Vision OfficeVision OfficeVision OfficeVision Office",
            starCount: "4.5",
          );
        },
      ),
    );
  }
}
