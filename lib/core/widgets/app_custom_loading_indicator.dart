import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppCustomLoadingIndicator extends StatelessWidget {
  final Color indicatorColor;

  const AppCustomLoadingIndicator({
    super.key,
    this.indicatorColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.hexagonDots(
        color: indicatorColor,
        size: 35.r,
      ),
    );
  }
}
