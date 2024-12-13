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
  // @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)
  DateTime? startDate;
  // @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)
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
  // static DateTime? _fromJsonDate(String? date) =>
  //     date != null ? DateTime.parse(date) : null;
  //
  // static String? _toJsonDate(DateTime? date) =>
  //     date?.toIso8601String();
}
