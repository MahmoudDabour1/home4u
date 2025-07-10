import 'package:freezed_annotation/freezed_annotation.dart';

part 'renovate_your_house_response_model.g.dart';

@JsonSerializable()
class RenovateYourHouseResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final Data? data;

  RenovateYourHouseResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory RenovateYourHouseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RenovateYourHouseResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RenovateYourHouseResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "phoneNumber")
  final String? phoneNumber;
  @JsonKey(name: "isInsideCompound")
  final bool? isInsideCompound;
  @JsonKey(name: "unitType")
  final UnitStatuses? unitType;
  @JsonKey(name: "unitStatuses")
  final UnitStatuses? unitStatuses;
  @JsonKey(name: "unitWorkTypes")
  final UnitStatuses? unitWorkTypes;
  @JsonKey(name: "workSkills")
  final UnitStatuses? workSkills;
  @JsonKey(name: "city")
  final City? city;
  @JsonKey(name: "governorate")
  final City? governorate;
  @JsonKey(name: "unitArea")
  final int? unitArea;
  @JsonKey(name: "budget")
  final int? budget;
  @JsonKey(name: "region")
  final int? region;
  @JsonKey(name: "numberOfRooms")
  final int? numberOfRooms;
  @JsonKey(name: "numberOfBathrooms")
  final int? numberOfBathrooms;
  @JsonKey(name: "requiredDuration")
  final int? requiredDuration;
  @JsonKey(name: "notes")
  final String? notes;

  Data({
    this.id,
    this.statusCode,
    this.phoneNumber,
    this.isInsideCompound,
    this.unitType,
    this.unitStatuses,
    this.unitWorkTypes,
    this.workSkills,
    this.city,
    this.governorate,
    this.unitArea,
    this.budget,
    this.region,
    this.numberOfRooms,
    this.numberOfBathrooms,
    this.requiredDuration,
    this.notes,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class City {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "name")
  final String? name;

  City({
    this.id,
    this.code,
    this.name,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable()
class UnitStatuses {
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

  UnitStatuses({
    this.id,
    this.code,
    this.name,
    this.nameAr,
    this.nameEn,
  });

  factory UnitStatuses.fromJson(Map<String, dynamic> json) =>
      _$UnitStatusesFromJson(json);

  Map<String, dynamic> toJson() => _$UnitStatusesToJson(this);
}