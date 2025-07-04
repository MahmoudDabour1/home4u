import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/projects_filter/data/models/base/user_base_model.dart';

import '../base/city_base_model.dart';
import '../base/user_base_type_model.dart';

part 'technical_asks_response_model.g.dart';

@JsonSerializable()
class TechnicalAsksResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final List<AskData>? data;

  TechnicalAsksResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory TechnicalAsksResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TechnicalAsksResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TechnicalAsksResponseModelToJson(this);
}

@JsonSerializable()
class AskData {
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
  @JsonKey(name: "askWorker")
  final AskWorker? askWorker;
  @JsonKey(name: "comment")
  final String? comment;
  @JsonKey(name: "isAccepted")
  final dynamic isAccepted;
  @JsonKey(name: "isFinished")
  final dynamic isFinished;
  @JsonKey(name: "isRejected")
  final dynamic isRejected;

  AskData({
    this.id,
    this.statusCode,
    this.createdDate,
    this.modifiedDate,
    this.user,
    this.askWorker,
    this.comment,
    this.isAccepted,
    this.isFinished,
    this.isRejected,
  });

  factory AskData.fromJson(Map<String, dynamic> json) =>
      _$AskDataFromJson(json);

  Map<String, dynamic> toJson() => _$AskDataToJson(this);
}

@JsonSerializable()
class AskWorker {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "createdDate")
  final DateTime? createdDate;
  @JsonKey(name: "modifiedDate")
  final DateTime? modifiedDate;
  @JsonKey(name: "projectName")
  final String? projectName;
  @JsonKey(name: "phoneNumber")
  final String? phoneNumber;
  @JsonKey(name: "projectDescription")
  final String? projectDescription;
  @JsonKey(name: "workerType")
  final UserBaseTypeModel? workerType;
  @JsonKey(name: "unitType")
  final UserBaseTypeModel? unitType;
  @JsonKey(name: "city")
  final CityBaseModel? city;
  @JsonKey(name: "governorate")
  final CityBaseModel? governorate;
  @JsonKey(name: "material")
  final CityBaseModel? material;
  @JsonKey(name: "budget")
  final int? budget;
  @JsonKey(name: "photos")
  final List<dynamic>? photos;
  @JsonKey(name: "user")
  final UserBaseModel? user;
  @JsonKey(name: "requestCount")
  final int? requestCount;
  @JsonKey(name: "askStatus")
  final String? askStatus;

  AskWorker({
    this.id,
    this.statusCode,
    this.createdDate,
    this.modifiedDate,
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
    this.user,
    this.requestCount,
    this.askStatus,
  });

  factory AskWorker.fromJson(Map<String, dynamic> json) =>
      _$AskWorkerFromJson(json);

  Map<String, dynamic> toJson() => _$AskWorkerToJson(this);
}
