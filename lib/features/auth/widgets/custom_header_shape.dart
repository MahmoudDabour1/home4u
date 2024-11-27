import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';

class CustomHeaderShape extends StatelessWidget {
  const CustomHeaderShape({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCardClipper(),
      child: Container(
        height: 140.h, // Fixed height
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
        ),
      ),
    );
  }
}

class CustomCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    double cornerRadius = 16.r;

    path.lineTo(0, size.height);

    final firstCurve = Offset(0, size.height - cornerRadius);
    final lastCurve = Offset(cornerRadius, size.height - cornerRadius);

    path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

    final  secondFirstCurve = Offset(0, size.height - cornerRadius);
    final secondLastCurve = Offset(size.width-cornerRadius, size.height - cornerRadius);
    path.quadraticBezierTo(secondFirstCurve.dx, secondFirstCurve.dy, secondLastCurve.dx, secondLastCurve.dy);

    final thirdFirstCurve = Offset(size.width, size.height - cornerRadius);
    final thirdLastCurve = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdFirstCurve.dx, thirdFirstCurve.dy, thirdLastCurve.dx, thirdLastCurve.dy);

    path.lineTo(size.width, 0);
    path.close();


    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}