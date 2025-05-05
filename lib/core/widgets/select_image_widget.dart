import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home4u/core/services/image_picker_services.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:image_picker/image_picker.dart';

import '../../locale/app_locale.dart';

class SelectImageWidget extends StatefulWidget {
  final cubit;
  final List<File> images;
  final Function(List<File>) updateImageCallback;

  const SelectImageWidget({
    super.key,
    required this.cubit,
    required this.images,
    required this.updateImageCallback,
  });

  @override
  State<SelectImageWidget> createState() => _SelectImageWidgetState();
}

class _SelectImageWidgetState extends State<SelectImageWidget> {
  late List<File> _images;

  @override
  void initState() {
    super.initState();
    _images = List<File>.from(widget.images); // Copy on init
  }

  void _addImage(File image) {
    setState(() {
      _images.add(image);
    });
    widget.updateImageCallback(_images);
  }

  void _addImages(List<File> images) {
    setState(() {
      _images.addAll(images);
    });
    widget.updateImageCallback(_images);
  }

  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
    widget.updateImageCallback(_images);
  }


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
                        _addImage(pickedImage);
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
                        _addImages(pickedImages);
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
              if (widget.images.isNotEmpty)
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(4.0.r),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: Stack(
                          children: [
                            Image.file(
                              widget.images[index],
                              width: MediaQuery.sizeOf(context).width /
                                  _images.length,
                              height: MediaQuery.sizeOf(context).height,
                              fit: BoxFit.cover,
                            ),
                            IconButton(
                              onPressed: () => _removeImage(index),
                              icon: Icon(
                                Icons.delete_forever,
                                color: Colors.red,
                                size: 24.w,
                              ),
                            ),
                          ],
                        ),
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
