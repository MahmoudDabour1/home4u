import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_projects_response_model.g.dart';

@HiveType(typeId: 10)
@JsonSerializable()
class GetProjectsResponseModel {
  @HiveField(0)
  bool? success;
  @HiveField(1)
  int? status;
  @HiveField(2)
  List<ProjectsData>? data;

  GetProjectsResponseModel({this.success, this.status, this.data});
  factory GetProjectsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetProjectsResponseModelFromJson(json);
}

@HiveType(typeId: 11)
@JsonSerializable()
class ProjectsData {
  @HiveField(0)
  int? id;
  @HiveField(1)
  int? statusCode;
  @HiveField(2)
  String? name;
  @HiveField(3)
  String? description;
  @HiveField(4)
  DateTime? startDate;
  @HiveField(5)
  DateTime? endDate;
  @HiveField(6)
  String? tools;
  @HiveField(7)
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