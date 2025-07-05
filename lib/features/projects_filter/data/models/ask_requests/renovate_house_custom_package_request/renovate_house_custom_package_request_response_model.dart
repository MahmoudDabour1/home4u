import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/projects_filter/data/models/base/user_base_model.dart';

part 'renovate_house_custom_package_request_response_model.g.dart';

@JsonSerializable()
class RenovateHouseCustomPackageRequestResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final List<RenovateHouseCustomPackageRequestData>? data;

  RenovateHouseCustomPackageRequestResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory RenovateHouseCustomPackageRequestResponseModel.fromJson(Map<String, dynamic> json) => _$RenovateHouseCustomPackageRequestResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RenovateHouseCustomPackageRequestResponseModelToJson(this);
}

@JsonSerializable()
class RenovateHouseCustomPackageRequestData {
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
  @JsonKey(name: "selectCustomPackage")
  final SelectCustomPackage? selectCustomPackage;
  @JsonKey(name: "comment")
  final String? comment;
  @JsonKey(name: "isAccepted")
  final dynamic isAccepted;
  @JsonKey(name: "isFinished")
  final dynamic isFinished;
  @JsonKey(name: "isRejected")
  final dynamic isRejected;

  RenovateHouseCustomPackageRequestData({
    this.id,
    this.statusCode,
    this.createdDate,
    this.modifiedDate,
    this.user,
    this.selectCustomPackage,
    this.comment,
    this.isAccepted,
    this.isFinished,
    this.isRejected,
  });

  factory RenovateHouseCustomPackageRequestData. fromJson(Map<String, dynamic> json) => _$RenovateHouseCustomPackageRequestDataFromJson(json);

  Map<String, dynamic> toJson() => _$RenovateHouseCustomPackageRequestDataToJson(this);
}

@JsonSerializable()
class SelectCustomPackage {
  @JsonKey(name: "id")
  final int? id;

  SelectCustomPackage({
    this.id,
  });

  factory SelectCustomPackage.fromJson(Map<String, dynamic> json) => _$SelectCustomPackageFromJson(json);

  Map<String, dynamic> toJson() => _$SelectCustomPackageToJson(this);
}
