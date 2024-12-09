import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserImageWidget extends StatelessWidget {
  const UserImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Positioned(
      top: 70.h,
      left: MediaQuery.sizeOf(context).width / 2 - 51.w,
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        child: CircleAvatar(
          radius: 51.r,
          foregroundImage:  AssetImage("assets/images/profile_back_image.png"),
        ),
      ),
    );
  }
}
