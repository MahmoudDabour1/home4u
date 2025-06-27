import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';

class AppCustomLoveContainer extends StatefulWidget {
  final VoidCallback onPressed;

  const AppCustomLoveContainer({super.key, required this.onPressed});

  @override
  State<AppCustomLoveContainer> createState() => _AppCustomLoveContainerState();
}

class _AppCustomLoveContainerState extends State<AppCustomLoveContainer> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35.w,
      height: 35.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.whiteColor,
      ),
      child: Center(
        child: IconButton(
          icon: Icon(
            Icons.favorite,
            color: isFavorite ? Colors.red : AppColors.grayColor,
            size: 20.h,
          ),
          onPressed: () {
            setState(() {
              isFavorite = !isFavorite;
            });
            widget.onPressed;
          },
        ),
      ),
    );
  }
}
