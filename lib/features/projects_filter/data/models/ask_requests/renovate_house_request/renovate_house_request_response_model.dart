import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/projects_filter/data/models/base/user_base_model.dart';

part 'renovate_house_request_response_model.g.dart';

@JsonSerializable()
class RenovateHouseRequestResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final List<RenovateHouseRequestData>? data;

  RenovateHouseRequestResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory RenovateHouseRequestResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$RenovateHouseRequestResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RenovateHouseRequestResponseModelToJson(this);
}

@JsonSerializable()
class RenovateHouseRequestData {
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
  @JsonKey(name: "homeRenovate")
  final HomeRenovate? homeRenovate;
  @JsonKey(name: "comment")
  final String? comment;
  @JsonKey(name: "isAccepted")
  final dynamic isAccepted;
  @JsonKey(name: "isFinished")
  final dynamic isFinished;
  @JsonKey(name: "isRejected")
  final dynamic isRejected;

  RenovateHouseRequestData({
    this.id,
    this.statusCode,
    this.createdDate,
    this.modifiedDate,
    this.user,
    this.homeRenovate,
    this.comment,
    this.isAccepted,
    this.isFinished,
    this.isRejected,
  });

  factory RenovateHouseRequestData.fromJson(Map<String, dynamic> json) =>
      _$RenovateHouseRequestDataFromJson(json);

  Map<String, dynamic> toJson() => _$RenovateHouseRequestDataToJson(this);
}

@JsonSerializable()
class HomeRenovate {
  @JsonKey(name: "id")
  final int? id;

  HomeRenovate({
    this.id,
  });

  factory HomeRenovate.fromJson(Map<String, dynamic> json) =>
      _$HomeRenovateFromJson(json);

  Map<String, dynamic> toJson() => _$HomeRenovateToJson(this);
}

