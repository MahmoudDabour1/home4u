import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:dio/dio.dart';

import '../data_sources/project_remote_data_source/project_remote_data_source.dart';
import '../models/project_data.dart';

abstract class ProjectRepository {
  Future<HttpResponse<String>> addProject(ProjectData projectData,
      List<XFile> images, XFile? coverImage, String? token);
}

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectRemoteDataSource _projectRemoteDataSource;

  ProjectRepositoryImpl(this._projectRemoteDataSource);

  @override
  Future<HttpResponse<String>> addProject(
    ProjectData projectData,
    List<XFile> images,
    XFile? coverImage,
    String? token,
  ) async {
    Dio dio = Dio();
    if (token != null) {
      dio.options.headers["Authorization"] = 'Bearer $token';
    }
    List<MultipartFile> multipartImages = [];
    for (XFile image in images) {
      File file = File(image.path);
      String fileName = file.path.split('/').last;
      MultipartFile multipartImage =
          await MultipartFile.fromFile(file.path, filename: fileName);
      multipartImages.add(multipartImage);
    }

    MultipartFile? multipartCover;
    if (coverImage != null) {
      File coverFile = File(coverImage.path);
      String coverFileName = coverFile.path.split('/').last;
      multipartCover =
          await MultipartFile.fromFile(coverFile.path, filename: coverFileName);
    }

    String projectDataJson = jsonEncode(projectData.toJson());
    return _projectRemoteDataSource.addProject(
      projectDataJson,
      multipartImages,
      multipartCover,
    );
  }
}
