import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class DeleteDialogButtonWidget extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color? textColor;
  final VoidCallback onPressed;
  final bool isBoarder;

  const DeleteDialogButtonWidget({
    super.key,
    required this.text,
     this.backgroundColor=AppColors.primaryColor,
     this.textColor,
    required this.onPressed,
     this.isBoarder=false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
            backgroundColor,
          ),
          fixedSize: WidgetStateProperty.all<Size>(
            Size(MediaQuery.sizeOf(context).width, 40.h),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0).r,
              side:isBoarder?BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ): BorderSide.none,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppStyles.font16DarkBlueBold.copyWith(
            color: textColor??AppColors.whiteColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
