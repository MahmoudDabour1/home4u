import 'package:json_annotation/json_annotation.dart';
part 'ask_engineer_look_up_response_model.g.dart';
@JsonSerializable()
class AskEngineerLookUpResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final EngineerData? data;

  AskEngineerLookUpResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory AskEngineerLookUpResponseModel.fromJson(Map<String, dynamic> json) => _$AskEngineerLookUpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AskEngineerLookUpResponseModelToJson(this);
}

@JsonSerializable()
class EngineerData {
  @JsonKey(name: "engineerType")
  final List<EngineerTypeFilter>? engineerType;
  @JsonKey(name: "unitType")
  final List<EngineerTypeFilter>? unitType;
  @JsonKey(name: "governorate")
  final List<Governorate>? governorate;
  @JsonKey(name: "urgencyLevel")
  final List<EngineerTypeFilter>? urgencyLevel;

  EngineerData({
    this.engineerType,
    this.unitType,
    this.governorate,
    this.urgencyLevel,
  });
  factory EngineerData.fromJson(Map<String, dynamic> json) => _$EngineerDataFromJson(json);
  Map<String, dynamic> toJson() => _$EngineerDataToJson(this);
}

@JsonSerializable()
class EngineerTypeFilter {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "nameAr")
  final String? nameAr;
  @JsonKey(name: "nameEn")
  final String? nameEn;

  EngineerTypeFilter({
    this.id,
    this.code,
    this.name,
    this.nameAr,
    this.nameEn,
  });

  factory EngineerTypeFilter.fromJson(Map<String, dynamic> json) => _$EngineerTypeFilterFromJson(json);
  Map<String, dynamic> toJson() => _$EngineerTypeFilterToJson(this);
}

@JsonSerializable()
class Governorate {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "name")
  final String? name;

  Governorate({
    this.id,
    this.code,
    this.name,
  });

  factory Governorate.fromJson(Map<String, dynamic> json) => _$GovernorateFromJson(json);

  Map<String, dynamic> toJson() => _$GovernorateToJson(this);
}
