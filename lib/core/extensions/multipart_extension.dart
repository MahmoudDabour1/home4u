import 'package:dio/dio.dart';

extension MultipartFileJson on MultipartFile {
  Map<String, dynamic> toJson() {
    throw UnimplementedError('MultipartFile cannot be serialized to JSON');
  }
}