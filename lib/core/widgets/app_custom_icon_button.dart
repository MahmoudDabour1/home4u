import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppCustomIconButton extends StatelessWidget {
  final String image;
  final VoidCallback onPressed;
  const AppCustomIconButton({super.key, required this.image, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        image,
        width: 24.w,
        height: 24.h,
      ),
    );
  }
}
