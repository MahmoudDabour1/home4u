import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home4u/core/networking/api_constants.dart';
import 'package:home4u/core/services/image_picker_services.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:image_picker/image_picker.dart';

import '../../locale/app_locale.dart';

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
          backgroundColor: AppColors.whiteColor,
          context: context,
          builder: (context) {
            return SizedBox(
              height: 150.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    leading: const Icon(Icons.camera_alt),
                    title: Text(AppLocale.camera.getString(context)),
                    onTap: () async {
                      Navigator.pop(context);
                      final imagePickerService = ImagePickerService();
                      final pickedImage = await imagePickerService.pickImage(
                          source: ImageSource.camera);
                      if (pickedImage != null) {
                        cubit.updateSelectedImages([pickedImage]);
                      }
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: Text(AppLocale.gallery.getString(context)),
                    onTap: () async {
                      Navigator.pop(context);
                      final imagePickerService = ImagePickerService();
                      final pickedImages =
                          await imagePickerService.pickMultipleImages();
                      if (pickedImages.isNotEmpty) {
                        cubit.updateSelectedImages(pickedImages);
                      }
                    },
                  ),
                ],
              ),
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
