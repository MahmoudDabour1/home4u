import 'package:json_annotation/json_annotation.dart';

part 'get_projects_response_model.g.dart';

@JsonSerializable()
class GetProjectsResponseModel {
  bool? success;
  int? status;
  List<ProjectsData>? data;

  GetProjectsResponseModel({this.success, this.status, this.data});
  factory GetProjectsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetProjectsResponseModelFromJson(json);
}
@JsonSerializable()
class ProjectsData {
  int? id;
  int? statusCode;
  String? name;
  String? description;
  DateTime? startDate;
  DateTime? endDate;
  String? tools;
  String? coverPath;

  ProjectsData({
    this.id,
    this.statusCode,
    this.name,
    this.description,
    this.startDate,
    this.endDate,
    this.tools,
    this.coverPath,
  });
  factory ProjectsData.fromJson(Map<String, dynamic> json) =>
      _$ProjectsDataFromJson(json);
}
