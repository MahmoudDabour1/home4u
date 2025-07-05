import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/projects_filter/data/models/base/base_type_model.dart';
import 'package:home4u/features/projects_filter/data/models/base/city_base_model.dart';
import 'package:home4u/features/projects_filter/data/models/base/photo_base_model.dart';
import 'package:home4u/features/projects_filter/data/models/base/user_base_model.dart';

part 'engineer_asks_response_model.g.dart';

@JsonSerializable()
class EngineerAsksResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final List<EngineerAskData>? data;

  EngineerAsksResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory EngineerAsksResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EngineerAsksResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$EngineerAsksResponseModelToJson(this);
}

@JsonSerializable()
class EngineerAskData {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "createdDate")
  final DateTime? createdDate;
  @JsonKey(name: "modifiedDate")
  final DateTime? modifiedDate;
  @JsonKey(name: "phoneNumber")
  final String? phoneNumber;
  @JsonKey(name: "projectName")
  final String? projectName;
  @JsonKey(name: "projectDescription")
  final String? projectDescription;
  @JsonKey(name: "engineerType")
  final BaseTypeModel? engineerType;
  @JsonKey(name: "unitType")
  final BaseTypeModel? unitType;
  @JsonKey(name: "budget")
  final int? budget;
  @JsonKey(name: "city")
  final CityBaseModel? city;
  @JsonKey(name: "governorate")
  final CityBaseModel? governorate;
  @JsonKey(name: "urgencyLevel")
  final BaseTypeModel? urgencyLevel;
  @JsonKey(name: "deadline")
  final DateTime? deadline;
  @JsonKey(name: "photos")
  final List<PhotoBaseModel>? photos;
  @JsonKey(name: "user")
  final UserBaseModel? user;
  @JsonKey(name: "requestCount")
  final int? requestCount;
  @JsonKey(name: "askStatus")
  final String? askStatus;

  EngineerAskData({
    this.id,
    this.statusCode,
    this.createdDate,
    this.modifiedDate,
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
    this.user,
    this.requestCount,
    this.askStatus,
  });

  factory EngineerAskData.fromJson(Map<String, dynamic> json) =>
      _$EngineerAskDataFromJson(json);

  Map<String, dynamic> toJson() => _$EngineerAskDataToJson(this);
}
