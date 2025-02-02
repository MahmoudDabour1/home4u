import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/locale/app_locale.dart';
import 'package:image_picker/image_picker.dart';

class BottomModel extends StatefulWidget implements PreferredSizeWidget {
  const BottomModel({
    super.key,
    required this.cubit,
    this.isCoverImage = false,
  });

  final cubit;
  final bool isCoverImage;

  @override
  State<BottomModel> createState() => _BottomModelState();

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

class _BottomModelState extends State<BottomModel> {
  File? myImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            height: 1.0,
            thickness: 2,
            indent: MediaQuery.sizeOf(context).width / 2 - 60,
            endIndent: MediaQuery.sizeOf(context).width / 2 - 60,
            color: AppColors.primaryColor,
          ),
          verticalSpace(16),
          Text(
            AppLocale.pleaseSelectImageWay.getString(context),
            style: AppStyles.font14DarkBlueBold,
          ),
          verticalSpace(16),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    widget.isCoverImage
                        ? widget.cubit.selectCover(
                            source: ImageSource.camera, context: context)
                        : widget.cubit.selectImage(
                            source: ImageSource.camera, context: context);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 20,
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        AppLocale.camera.getString(context),
                        style: AppStyles.font16DarkBlueBold,
                      ),
                    ],
                  ),
                ),
                horizontalSpace(20),
                ElevatedButton(
                  onPressed: () => widget.isCoverImage
                      ? widget.cubit.selectCover(
                          source: ImageSource.gallery, context: context)
                      : widget.cubit.selectImage(
                          source: ImageSource.gallery, context: context),
                  child: Row(
                    children: [
                      Icon(
                        Icons.image_search_sharp,
                        size: 20,
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        AppLocale.gallery.getString(context),
                        style: AppStyles.font16DarkBlueBold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
