import 'package:home4u/features/projects_filter/data/models/base/base_type_model.dart';
import 'package:home4u/features/projects_filter/data/models/base/city_base_model.dart';
import 'package:home4u/features/projects_filter/data/models/base/user_base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'renovate_house_asks_response_model.g.dart';

@JsonSerializable()
class RenovateHouseAsksResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final List<RenovateHouseAskData>? data;

  RenovateHouseAsksResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory RenovateHouseAsksResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RenovateHouseAsksResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RenovateHouseAsksResponseModelToJson(this);
}

@JsonSerializable()
class RenovateHouseAskData {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "createdDate")
  final DateTime? createdDate;
  @JsonKey(name: "modifiedDate")
  final DateTime? modifiedDate;
  @JsonKey(name: "user")
  final UserBaseModel? user;
  @JsonKey(name: "phoneNumber")
  final String? phoneNumber;
  @JsonKey(name: "isInsideCompound")
  final bool? isInsideCompound;
  @JsonKey(name: "unitType")
  final BaseTypeModel? unitType;
  @JsonKey(name: "unitStatuses")
  final BaseTypeModel? unitStatuses;
  @JsonKey(name: "unitWorkTypes")
  final BaseTypeModel? unitWorkTypes;
  @JsonKey(name: "workSkills")
  final BaseTypeModel? workSkills;
  @JsonKey(name: "city")
  final CityBaseModel? city;
  @JsonKey(name: "governorate")
  final CityBaseModel? governorate;
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
  @JsonKey(name: "requestCount")
  final int? requestCount;
  @JsonKey(name: "askStatus")
  final int? askStatus;

  RenovateHouseAskData({
    this.id,
    this.statusCode,
    this.createdDate,
    this.modifiedDate,
    this.user,
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
    this.requestCount,
    this.askStatus,
  });

  factory RenovateHouseAskData.fromJson(Map<String, dynamic> json) =>
      _$RenovateHouseAskDataFromJson(json);

  Map<String, dynamic> toJson() => _$RenovateHouseAskDataToJson(this);
}
