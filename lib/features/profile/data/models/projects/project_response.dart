import 'package:json_annotation/json_annotation.dart';

part 'project_response.g.dart';

@JsonSerializable()
class ProjectResponse {
  final bool success;
  final int status;
  final ProjectDataResponse data;

  ProjectResponse({
    required this.success,
    required this.status,
    required this.data,
  });

  factory ProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectResponseToJson(this);
}

@JsonSerializable()
class ProjectDataResponse {
  final int id;
  final int? statusCode;
  final String name;
  final String? description;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? tools;
  // final dynamic images;

  ProjectDataResponse({
    required this.id,
    this.statusCode,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.tools,
    // this.images,
  });

  factory ProjectDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDataResponseToJson(this);
}