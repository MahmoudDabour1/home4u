import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/projects_filter/data/models/base/base_type_model.dart';
import 'package:home4u/features/projects_filter/data/models/base/city_base_model.dart';
import 'package:home4u/features/projects_filter/data/models/base/photo_base_model.dart';
import 'package:home4u/features/projects_filter/data/models/base/user_base_model.dart';

part 'ask_engineer_request_response_model.g.dart';

@JsonSerializable()
class AskEngineerRequestResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final List<AskEngineerRequestData>? data;

  AskEngineerRequestResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory AskEngineerRequestResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AskEngineerRequestResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AskEngineerRequestResponseModelToJson(this);
}

@JsonSerializable()
class AskEngineerRequestData {
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
  @JsonKey(name: "askEngineer")
  final AskEngineer? askEngineer;
  @JsonKey(name: "comment")
  final String? comment;
  @JsonKey(name: "isAccepted")
  final dynamic isAccepted;
  @JsonKey(name: "isFinished")
  final dynamic isFinished;
  @JsonKey(name: "isRejected")
  final dynamic isRejected;

  AskEngineerRequestData({
    this.id,
    this.statusCode,
    this.createdDate,
    this.modifiedDate,
    this.user,
    this.askEngineer,
    this.comment,
    this.isAccepted,
    this.isFinished,
    this.isRejected,
  });

  factory AskEngineerRequestData.fromJson(Map<String, dynamic> json) =>
      _$AskEngineerRequestDataFromJson(json);

  Map<String, dynamic> toJson() => _$AskEngineerRequestDataToJson(this);
}

@JsonSerializable()
class AskEngineer {
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

  AskEngineer({
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

  factory AskEngineer.fromJson(Map<String, dynamic> json) =>
      _$AskEngineerFromJson(json);

  Map<String, dynamic> toJson() => _$AskEngineerToJson(this);
}
