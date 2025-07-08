import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/projects_filter/data/models/base/user_base_model.dart';
import 'package:home4u/features/projects_filter/data/models/base/base_type_model.dart';

 part 'renovate_house_custom_package_asks_response_model.g.dart';

@JsonSerializable()
class RenovateHouseCustomPackageAsksResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final List<RenovateHouseCustomPackageAskData>? data;

  RenovateHouseCustomPackageAsksResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory RenovateHouseCustomPackageAsksResponseModel.fromJson(
      Map<String, dynamic> json) =>
      _$RenovateHouseCustomPackageAsksResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RenovateHouseCustomPackageAsksResponseModelToJson(this);
}

@JsonSerializable()
class RenovateHouseCustomPackageAskData {
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
  @JsonKey(name: "isInsideCompound")
  final bool? isInsideCompound;
  @JsonKey(name: "unitType")
  final BaseTypeModel? unitType;
  @JsonKey(name: "customPackage")
  final CustomPackage? customPackage;
  @JsonKey(name: "user")
  final UserBaseModel? user;
  @JsonKey(name: "requestCount")
  final int? requestCount;
  @JsonKey(name: "askStatus")
  final String? askStatus;

  RenovateHouseCustomPackageAskData({
    this.id,
    this.statusCode,
    this.createdDate,
    this.modifiedDate,
    this.phoneNumber,
    this.isInsideCompound,
    this.unitType,
    this.customPackage,
    this.user,
    this.requestCount,
    this.askStatus,
  });

  factory RenovateHouseCustomPackageAskData.fromJson(
      Map<String, dynamic> json) =>
      _$RenovateHouseCustomPackageAskDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RenovateHouseCustomPackageAskDataToJson(this);


}

@JsonSerializable()
class CustomPackage {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "createdDate")
  final DateTime? createdDate;
  @JsonKey(name: "modifiedDate")
  final DateTime? modifiedDate;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "nameAr")
  final String? nameAr;
  @JsonKey(name: "nameEn")
  final String? nameEn;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "details")
  final String? details;
  @JsonKey(name: "detailsAr")
  final String? detailsAr;
  @JsonKey(name: "detailsEn")
  final String? detailsEn;

  CustomPackage({
    this.id,
    this.statusCode,
    this.createdDate,
    this.modifiedDate,
    this.name,
    this.nameAr,
    this.nameEn,
    this.price,
    this.details,
    this.detailsAr,
    this.detailsEn,
  });

  factory CustomPackage.fromJson(Map<String, dynamic> json) =>
      _$CustomPackageFromJson(json);

  Map<String, dynamic> toJson() => _$CustomPackageToJson(this);
}