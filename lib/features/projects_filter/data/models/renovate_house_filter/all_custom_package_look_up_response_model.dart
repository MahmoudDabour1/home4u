import 'package:json_annotation/json_annotation.dart';
part 'all_custom_package_look_up_response_model.g.dart';
@JsonSerializable()
class AllCustomPackageLookUpResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final List<CustomPackageList>? data;

  AllCustomPackageLookUpResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory AllCustomPackageLookUpResponseModel.fromJson(Map<String, dynamic> json) => _$AllCustomPackageLookUpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllCustomPackageLookUpResponseModelToJson(this);
}

@JsonSerializable()
class CustomPackageList {
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

  CustomPackageList({
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
  factory CustomPackageList.fromJson(Map<String, dynamic> json) => _$CustomPackageListFromJson(json);
  Map<String, dynamic> toJson() => _$CustomPackageListToJson(this);
}
