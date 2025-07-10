import 'package:freezed_annotation/freezed_annotation.dart';

part 'engineering_office_body.g.dart';

@JsonSerializable()
class EngineeringOfficeRequest {
  @JsonKey(name: "tradeName")
  final String tradeName;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "engineeringOfficeField")
  final EngineeringOffice engineeringOfficeField;
  @JsonKey(name: "engineeringOfficeDepartments")
  final List<EngineeringOffice> engineeringOfficeDepartments;

  EngineeringOfficeRequest({
    required this.tradeName,
    required this.description,
    required this.engineeringOfficeField,
    required this.engineeringOfficeDepartments,
  });

  factory EngineeringOfficeRequest.fromJson(Map<String, dynamic> json) => _$EngineeringOfficeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EngineeringOfficeRequestToJson(this);
}

@JsonSerializable()
class EngineeringOffice {
  @JsonKey(name: "id")
  final int id;

  EngineeringOffice({
    required this.id,
  });

  factory EngineeringOffice.fromJson(Map<String, dynamic> json) => _$EngineeringOfficeFromJson(json);

  Map<String, dynamic> toJson() => _$EngineeringOfficeToJson(this);
}
