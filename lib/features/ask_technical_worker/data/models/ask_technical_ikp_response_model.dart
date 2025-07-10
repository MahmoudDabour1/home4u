import 'package:json_annotation/json_annotation.dart';

part 'ask_technical_ikp_response_model.g.dart';
@JsonSerializable()
class AskTechnicalIkpResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final Data? data;

  AskTechnicalIkpResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory AskTechnicalIkpResponseModel.fromJson(Map<String, dynamic> json) => _$AskTechnicalIkpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AskTechnicalIkpResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "workerType")
  final List<AskTechnicalType>? workerType;
  @JsonKey(name: "unitType")
  final List<AskTechnicalType>? unitType;
  @JsonKey(name: "governorate")
  final List<Governorate>? governorate;
  @JsonKey(name: "material")
  final List<Governorate>? material;

  Data({
    this.workerType,
    this.unitType,
    this.governorate,
    this.material,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
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

@JsonSerializable()
class AskTechnicalType {
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

  AskTechnicalType({
    this.id,
    this.code,
    this.name,
    this.nameAr,
    this.nameEn,
  });

  factory AskTechnicalType.fromJson(Map<String, dynamic> json) => _$AskTechnicalTypeFromJson(json);

  Map<String, dynamic> toJson() => _$AskTechnicalTypeToJson(this);
}
