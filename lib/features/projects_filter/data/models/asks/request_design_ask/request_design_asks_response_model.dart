import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/projects_filter/data/models/base/base_type_model.dart';
import 'package:home4u/features/projects_filter/data/models/base/city_base_model.dart';
import 'package:home4u/features/projects_filter/data/models/base/user_base_model.dart';

part 'request_design_asks_response_model.g.dart';

@JsonSerializable()
class RequestDesignAsksResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final List<RequestDesignAskData>? data;

  RequestDesignAsksResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory RequestDesignAsksResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RequestDesignAsksResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestDesignAsksResponseModelToJson(this);
}

@JsonSerializable()
class RequestDesignAskData {
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
  @JsonKey(name: "unitType")
  final BaseTypeModel? unitType;
  @JsonKey(name: "governorate")
  final CityBaseModel? governorate;
  @JsonKey(name: "unitArea")
  final int? unitArea;
  @JsonKey(name: "budget")
  final int? budget;
  @JsonKey(name: "requiredDuration")
  final int? requiredDuration;
  @JsonKey(name: "notes")
  final String? notes;
  @JsonKey(name: "user")
  final UserBaseModel? user;
  @JsonKey(name: "requestCount")
  final int? requestCount;
  @JsonKey(name: "askStatus")
  final String? askStatus;

  RequestDesignAskData({
    this.id,
    this.statusCode,
    this.createdDate,
    this.modifiedDate,
    this.phoneNumber,
    this.unitType,
    this.governorate,
    this.unitArea,
    this.budget,
    this.requiredDuration,
    this.notes,
    this.user,
    this.requestCount,
    this.askStatus,
  });

  factory RequestDesignAskData.fromJson(Map<String, dynamic> json) =>
      _$RequestDesignAskDataFromJson(json);

  Map<String, dynamic> toJson() => _$RequestDesignAskDataToJson(this);
}
