import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_response.g.dart';

@JsonSerializable()
class ProjectResponse {
  @JsonKey(name: "success")
  final bool success;
  @JsonKey(name: "status")
  final int status;
  @JsonKey(name: "data")
  final Data data;

  ProjectResponse({
    required this.success,
    required this.status,
    required this.data,
  });

  factory ProjectResponse.fromJson(Map<String, dynamic> json) => _$ProjectResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "statusCode")
  final dynamic statusCode;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "startDate")
  final DateTime startDate;
  @JsonKey(name: "endDate")
  final DateTime endDate;
  @JsonKey(name: "tools")
  final String tools;
  @JsonKey(name: "images")
  final List<Image>? images;

  Data({
    required this.id,
    required this.statusCode,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.tools,
    this.images,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Image {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "path")
  final String path;

  Image({
    required this.id,
    required this.path,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
