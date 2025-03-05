import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppCustomIconButton extends StatelessWidget {
  final String image;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  const AppCustomIconButton({super.key, required this.image, required this.onPressed,this.width,this.height});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        image,
        width:width?? 24.w,
        height:height?? 24.h,
      ),
    );
  }
}
