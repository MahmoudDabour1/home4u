
import 'package:json_annotation/json_annotation.dart';
part 'ask_technical_response_model.g.dart';
@JsonSerializable()
class AskTechnicalResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final Data? data;

  AskTechnicalResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory AskTechnicalResponseModel.fromJson(Map<String, dynamic> json) => _$AskTechnicalResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AskTechnicalResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "projectName")
  final String? projectName;
  @JsonKey(name: "phoneNumber")
  final String? phoneNumber;
  @JsonKey(name: "projectDescription")
  final String? projectDescription;
  @JsonKey(name: "workerType")
  final Type? workerType;
  @JsonKey(name: "unitType")
  final Type? unitType;
  @JsonKey(name: "city")
  final City? city;
  @JsonKey(name: "governorate")
  final City? governorate;
  @JsonKey(name: "material")
  final City? material;
  @JsonKey(name: "budget")
  final int? budget;
  @JsonKey(name: "photos")
  final dynamic photos;

  Data({
    this.id,
    this.statusCode,
    this.projectName,
    this.phoneNumber,
    this.projectDescription,
    this.workerType,
    this.unitType,
    this.city,
    this.governorate,
    this.material,
    this.budget,
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
class Type {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "code")
  final dynamic code;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "nameAr")
  final String? nameAr;
  @JsonKey(name: "nameEn")
  final String? nameEn;

  Type({
    this.id,
    this.code,
    this.name,
    this.nameAr,
    this.nameEn,
  });

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);
}
