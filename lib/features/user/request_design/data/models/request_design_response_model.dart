import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_design_response_model.g.dart';

@JsonSerializable()
class RequestDesignResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final Data? data;

  RequestDesignResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory RequestDesignResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RequestDesignResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestDesignResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "phoneNumber")
  final String? phoneNumber;
  @JsonKey(name: "unitType")
  final UnitType? unitType;
  @JsonKey(name: "governorate")
  final Governorate? governorate;
  @JsonKey(name: "unitArea")
  final int? unitArea;
  @JsonKey(name: "budget")
  final int? budget;
  @JsonKey(name: "requiredDuration")
  final int? requiredDuration;
  @JsonKey(name: "notes")
  final String? notes;

  Data({
    this.id,
    this.statusCode,
    this.phoneNumber,
    this.unitType,
    this.governorate,
    this.unitArea,
    this.budget,
    this.requiredDuration,
    this.notes,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Governorate {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "code")
  final dynamic code;
  @JsonKey(name: "name")
  final dynamic name;

  Governorate({
    this.id,
    this.code,
    this.name,
  });

  factory Governorate.fromJson(Map<String, dynamic> json) =>
      _$GovernorateFromJson(json);

  Map<String, dynamic> toJson() => _$GovernorateToJson(this);
}

@JsonSerializable()
class UnitType {
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

  UnitType({
    this.id,
    this.code,
    this.name,
    this.nameAr,
    this.nameEn,
  });

  factory UnitType.fromJson(Map<String, dynamic> json) =>
      _$UnitTypeFromJson(json);

  Map<String, dynamic> toJson() => _$UnitTypeToJson(this);
}
