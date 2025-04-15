import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';

class CartProductDetailsFavoriteButton extends StatefulWidget {
  const CartProductDetailsFavoriteButton({super.key});

  @override
  State<CartProductDetailsFavoriteButton> createState() =>
      _CartProductDetailsFavoriteButtonState();
}

class _CartProductDetailsFavoriteButtonState
    extends State<CartProductDetailsFavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16).r,
        color: const Color(0xffF0ECE6),
      ),
      child: IconButton(
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        style: ButtonStyle(
          fixedSize: WidgetStateProperty.all<Size>(Size(50.w, 50.h)),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16).r),
          ),
        ),
        icon: SvgPicture.asset(
          AppAssets.saveIconSvg,
          width: 24.w,
          height: 24.h,
          colorFilter: ColorFilter.mode(
            isFavorite ? Colors.red : AppColors.blackColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
