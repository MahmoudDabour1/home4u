import 'package:freezed_annotation/freezed_annotation.dart';

part 'engineering_office_body.g.dart';

@JsonSerializable()
class EngineeringOfficeBody {
  @JsonKey(name: "tradeName")
  String? tradeName;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "engineeringOfficeField")
  EngineeringOfficeId? engineeringOfficeField;
  @JsonKey(name: "engineeringOfficeDepartments")
  List<EngineeringOfficeId>? engineeringOfficeDepartments;

  EngineeringOfficeBody({
    this.tradeName,
    this.description,
    this.engineeringOfficeField,
    this.engineeringOfficeDepartments,
  });

  factory EngineeringOfficeBody.fromJson(Map<String, dynamic> json) =>
      _$EngineeringOfficeBodyFromJson(json);
}

@JsonSerializable()
class EngineeringOfficeId {
  @JsonKey(name: "id")
  int? id;

  EngineeringOfficeId({
    this.id,
  });

  factory EngineeringOfficeId.fromJson(Map<String, dynamic> json) =>
      _$EngineeringOfficeIdFromJson(json);
}
