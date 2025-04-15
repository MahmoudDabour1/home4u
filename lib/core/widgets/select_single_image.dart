// import 'dart:io';
//
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_localization/flutter_localization.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../../locale/app_locale.dart';
// import '../services/image_picker_services.dart';
// import '../theming/app_assets.dart';
// import '../theming/app_colors.dart';
// import '../theming/app_styles.dart';
//
// class SelectSingleImage extends StatelessWidget {
//   final  cubit;
//   final File? image;
//   final String imageType;
//
//   const SelectSingleImage({
//     super.key,
//     required this.cubit,
//     required this.image,
//     required this.imageType,
//   });
//
//   Future<void> _pickImage(BuildContext context, ImageSource source) async {
//     Navigator.pop(context);
//     try {
//       final pickedImage = await ImagePickerService().pickImage(source: source);
//       if (pickedImage != null) {
//         cubit.updateSelectedImages(pickedImage, imageType);
//       }
//     } catch (e) {
//       debugPrint("Image picker error: $e");
//       // Show error to user if needed
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         showModalBottomSheet(
//           context: context,
//           builder: (context) => SafeArea(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ListTile(
//                   leading: const Icon(Icons.camera_alt),
//                   title: const Text('Camera'),
//                   onTap: () => _pickImage(context, ImageSource.camera),
//                 ),
//                 ListTile(
//                   leading: const Icon(Icons.photo_library),
//                   title: const Text('Gallery'),
//                   onTap: () => _pickImage(context, ImageSource.gallery),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//       child: SizedBox(
//         height: 150.h,
//         width: double.infinity,
//         child: DottedBorder(
//           borderType: BorderType.RRect,
//           radius: Radius.circular(12.r),
//           dashPattern: const [6, 6],
//           color: AppColors.primaryColor,
//           strokeWidth: 2,
//           child: image != null
//               ? ClipRRect(
//             borderRadius: BorderRadius.circular(12.r),
//             child: Image.file(
//               image!,
//               fit: BoxFit.cover,
//               width: double.infinity,
//               height: double.infinity,
//             ),
//           )
//               : Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SvgPicture.asset(
//                   AppAssets.uploadImageIcon,
//                   width: 48.w,
//                   height: 48.h,
//                 ),
//                 SizedBox(height: 8.h),
//                 Text(
//                   'Tap to add image',
//                   style: AppStyles.font16BlackLight,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }