import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

abstract class ImagePickerServiceBase {
  Future<File?> pickImage({ImageSource source});

  Future<List<File>> pickMultipleImages({int maxImages = 6});

  Future<File?> pickVideo({ImageSource source});
}

class ImagePickerService implements ImagePickerServiceBase {
  final ImagePicker _picker = ImagePicker();

  @override
  Future<File?> pickImage({ImageSource source = ImageSource.gallery}) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        imageQuality: 80,
      );
      return image != null ? File(image.path) : null;
    } catch (e) {
      log("Error picking image: $e");
      return null;
    }
  }

  @override
  Future<List<File>> pickMultipleImages({int maxImages = 5}) async {
    try {
      final List<XFile> images = await _picker.pickMultiImage(
        imageQuality: 80,
      );
      return images.map((xFile) => File(xFile.path)).toList();
    } catch (e) {
      log("Error picking multiple images: $e");
      return [];
    }
  }

  @override
  Future<File?> pickVideo({ImageSource source = ImageSource.gallery}) async {
    try {
      final XFile? video = await _picker.pickVideo(
        source: source,
      );
      return video != null ? File(video.path) : null;
    } catch (e) {
      log("Error picking video: $e");
      return null;
    }
  }
}


/// SelectImageWidget.dart
// import 'dart:io';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../core/theming/app_assets.dart';
// import '../theming/app_colors.dart';
// import '../theming/app_styles.dart';
//
// class SelectImageWidget extends StatefulWidget {
//   final Function(List<File>) onImagesSelected; // Callback to pass images
//   final bool isCoverImage;
//   final bool isEdit;
//
//   const SelectImageWidget({
//     super.key,
//     required this.onImagesSelected,
//     this.isCoverImage = false,
//     this.isEdit = false,
//   });
//
//   @override
//   _SelectImageWidgetState createState() => _SelectImageWidgetState();
// }
//
// class _SelectImageWidgetState extends State<SelectImageWidget> {
//   final ImagePicker _picker = ImagePicker();
//   List<File> _images = [];
//
//   Future<void> _pickImages(bool isCamera) async {
//     try {
//       List<XFile>? pickedFiles = isCamera
//           ? [await _picker.pickImage(source: ImageSource.camera)]
//           : await _picker.pickMultiImage();
//
//       if (pickedFiles != null) {
//         setState(() {
//           _images = pickedFiles.map((file) => File(file.path)).toList();
//         });
//         widget.onImagesSelected(_images); // Pass images to parent
//       }
//     } catch (e) {
//       _showErrorDialog("Failed to pick image: $e");
//     }
//   }
//
//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Error"),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("OK"),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         showModalBottomSheet(
//           context: context,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
//           ),
//           builder: (context) {
//             return SizedBox(
//               height: 150.h,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ListTile(
//                     leading: const Icon(Icons.camera_alt),
//                     title: const Text("Take a Photo"),
//                     onTap: () {
//                       Navigator.pop(context);
//                       _pickImages(true);
//                     },
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.photo_library),
//                     title: const Text("Choose from Gallery"),
//                     onTap: () {
//                       Navigator.pop(context);
//                       _pickImages(false);
//                     },
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//       child: DottedBorder(
//         padding: EdgeInsets.all(20.r),
//         strokeCap: StrokeCap.round,
//         borderType: BorderType.RRect,
//         radius: Radius.circular(20.r),
//         dashPattern: [10, 10],
//         color: AppColors.primaryColor,
//         strokeWidth: 2,
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             _images.isNotEmpty
//                 ? ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: _images.length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Image.file(
//                           _images[index],
//                           width: 100,
//                           height: 100,
//                           fit: BoxFit.cover,
//                         ),
//                       );
//                     },
//                   )
//                 : Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SvgPicture.asset(
//                           AppAssets.uploadImageIcon,
//                           width: 64.w,
//                           height: 64.h,
//                         ),
//                         Text(
//                           "Tap to add images",
//                           style: AppStyles.font16BlackLight,
//                           textAlign: TextAlign.center,
//                         ),
//                       ],
//                     ),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }