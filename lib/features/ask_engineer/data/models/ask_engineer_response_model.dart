
import 'package:json_annotation/json_annotation.dart';

part 'ask_engineer_response_model.g.dart';
@JsonSerializable()
class AskEngineerResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final Data? data;

  AskEngineerResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory AskEngineerResponseModel.fromJson(Map<String, dynamic> json) => _$AskEngineerResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AskEngineerResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "phoneNumber")
  final String? phoneNumber;
  @JsonKey(name: "projectName")
  final String? projectName;
  @JsonKey(name: "projectDescription")
  final String? projectDescription;
  @JsonKey(name: "engineerType")
  final EngineerType? engineerType;
  @JsonKey(name: "unitType")
  final EngineerType? unitType;
  @JsonKey(name: "budget")
  final int? budget;
  @JsonKey(name: "city")
  final City? city;
  @JsonKey(name: "governorate")
  final City? governorate;
  @JsonKey(name: "urgencyLevel")
  final EngineerType? urgencyLevel;
  @JsonKey(name: "deadline")
  final String? deadline;
  @JsonKey(name: "photos")
  final dynamic photos;

  Data({
    this.id,
    this.statusCode,
    this.phoneNumber,
    this.projectName,
    this.projectDescription,
    this.engineerType,
    this.unitType,
    this.budget,
    this.city,
    this.governorate,
    this.urgencyLevel,
    this.deadline,
    this.photos,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class City {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "code")
  final dynamic code;
  @JsonKey(name: "name")
  final dynamic name;

  City({
    this.id,
    this.code,
    this.name,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable()
class EngineerType {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "code")
  final dynamic code;
  @JsonKey(name: "name")
  final dynamic name;
  @JsonKey(name: "nameAr")
  final dynamic nameAr;
  @JsonKey(name: "nameEn")
  final dynamic nameEn;

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
