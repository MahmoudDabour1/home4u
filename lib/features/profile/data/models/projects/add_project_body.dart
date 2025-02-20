import 'package:json_annotation/json_annotation.dart';

part 'add_project_body.g.dart';

@JsonSerializable()
class AddProjectBody {
  final String name;
  final String description;
  final String startDate;
  final String endDate;
  final String tools;

  AddProjectBody({
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.tools,
  });

  factory AddProjectBody.fromJson(Map<String, dynamic> json) =>
      _$AddProjectBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AddProjectBodyToJson(this);
}