import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../theming/app_colors.dart';

class AppCustomLoadingIndicator extends StatelessWidget {
  final Color loadingColor;

  const AppCustomLoadingIndicator({
    super.key,
    this.loadingColor = AppColors.whiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.hexagonDots(
        color: loadingColor,
        size: 35.r,
      ),
    );
  }
}
