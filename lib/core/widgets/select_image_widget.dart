import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home4u/core/networking/api_constants.dart';
import 'package:home4u/core/theming/app_assets.dart';

import '../../locale/app_locale.dart';
import '../theming/app_colors.dart';
import '../theming/app_styles.dart';
import 'bottom_model.dart';


///ToDo : Need to refactor to work with carousel slider
///
class SelectImageWidget extends StatelessWidget {
  final cubit;
  final List<File> images;
  final bool isCoverImage;
  final bool isEdit;

  const SelectImageWidget({
    super.key,
    required this.cubit,
    required this.images,
    this.isCoverImage = false,
    this.isEdit = false,
  });

  @override
  Widget build(BuildContext context) {
    log("height : ${MediaQuery.sizeOf(context).height * 0.245}");

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
        height: MediaQuery.sizeOf(context).height * 0.25,
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
              if (isCoverImage && images.isNotEmpty)
                isEdit
                    ? Image.network(
                        ApiConstants.getImageBaseUrl(images.first.path),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        images.first,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )
              else if (!isCoverImage && images.isNotEmpty)
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.file(
                        images[index],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                )
              else
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing : 16.h,
                    children: [
                      SvgPicture.asset(
                        AppAssets.uploadImageIcon,
                        width: 64.w,
                        height: 64.h,
                      ),
                      Text(
                        AppLocale.tapToAddImage.getString(context),
                        style: AppStyles.font16BlackLight,
                        textAlign: TextAlign.center,
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
