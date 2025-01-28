import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../locale/app_locale.dart';
import '../theming/app_colors.dart';
import '../theming/app_styles.dart';
import '../utils/spacing.dart';
import 'bottom_model.dart';

class SelectImageWidget extends StatelessWidget {
  final cubit;
  final File? image;
  final bool isCoverImage;

  const SelectImageWidget(
      {super.key,
      required this.cubit,
      required this.image,
      this.isCoverImage = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          context: context,
          builder: (context) {
            return SizedBox(
              height: 150.h,
              child: BottomModel(cubit: cubit, isCoverImage: isCoverImage),
            );
          },
        );
      },
      child: SizedBox(
        height: 120.h,
        width: MediaQuery.sizeOf(context).width - 48.w,
        child: DottedBorder(
          padding: EdgeInsets.all(20.r),
          strokeCap: StrokeCap.round,
          borderType: BorderType.RRect,
          radius: Radius.circular(20.r),
          dashPattern: [10, 10],
          color: AppColors.primaryColor,
          strokeWidth: 2,
          child: Stack(
            alignment: Alignment.center,
            children: [
              image != null
                  ? Center(
                      child: Image.file(
                        image!,
                        width: MediaQuery.sizeOf(context).width - 48.w,
                        fit: BoxFit.fitWidth,
                      ),
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt,
                            color: AppColors.primaryColor,
                          ),
                          verticalSpace(10),
                          Text(
                            AppLocale.tapToAddImage.getString(context),
                            style: AppStyles.font14DarkBlueBold,
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
