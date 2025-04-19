
import 'package:json_annotation/json_annotation.dart';
part 'ask_engineer_ikp_response_model.g.dart';
@JsonSerializable()
class AskEngineerIkpResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final Data? data;

  AskEngineerIkpResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory AskEngineerIkpResponseModel.fromJson(Map<String, dynamic> json) => _$AskEngineerIkpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AskEngineerIkpResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "engineerType")
  final List<EngineerType>? engineerType;
  @JsonKey(name: "unitType")
  final List<EngineerType>? unitType;
  @JsonKey(name: "governorate")
  final List<Governorate>? governorate;
  @JsonKey(name: "urgencyLevel")
  final List<EngineerType>? urgencyLevel;

  Data({
    this.engineerType,
    this.unitType,
    this.governorate,
    this.urgencyLevel,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class EngineerType {
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

  EngineerType({
    this.id,
    this.code,
    this.name,
    this.nameAr,
    this.nameEn,
  });

  factory EngineerType.fromJson(Map<String, dynamic> json) => _$EngineerTypeFromJson(json);

  Map<String, dynamic> toJson() => _$EngineerTypeToJson(this);
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
