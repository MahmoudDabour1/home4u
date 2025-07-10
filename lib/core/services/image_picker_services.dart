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