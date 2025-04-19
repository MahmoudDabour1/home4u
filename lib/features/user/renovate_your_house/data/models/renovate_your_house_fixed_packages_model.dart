import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'renovate_your_house_fixed_packages_model.g.dart';

@HiveType(typeId: 96)
@JsonSerializable()
class RenovateYourHouseFixedPackagesModel {
  @HiveField(1)
  @JsonKey(name: "success")
  final bool success;
  @HiveField(3)
  @JsonKey(name: "status")
  final int status;
  @HiveField(5)
  @JsonKey(name: "data")
  final List<FixedPackageDataModel> data;

  RenovateYourHouseFixedPackagesModel({
    required this.success,
    required this.status,
    required this.data,
  });

  factory RenovateYourHouseFixedPackagesModel.fromJson(
          Map<String, dynamic> json) =>
      _$RenovateYourHouseFixedPackagesModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RenovateYourHouseFixedPackagesModelToJson(this);
}

@HiveType(typeId: 2)
@JsonSerializable()
class FixedPackageDataModel {
  @HiveField(1)
  @JsonKey(name: "id")
  final int id;
  @HiveField(3)
  @JsonKey(name: "statusCode")
  final int statusCode;
  @HiveField(5)
  @JsonKey(name: "name")
  final String name;
  @HiveField(7)
  @JsonKey(name: "nameAr")
  final String nameAr;
  @HiveField(9)
  @JsonKey(name: "nameEn")
  final String nameEn;
  @HiveField(11)
  @JsonKey(name: "price")
  final int price;
  @HiveField(13)
  @JsonKey(name: "details")
  final String details;
  @HiveField(15)
  @JsonKey(name: "detailsAr")
  final String detailsAr;
  @HiveField(17)
  @JsonKey(name: "detailsEn")
  final String detailsEn;

  FixedPackageDataModel({
    required this.id,
    required this.statusCode,
    required this.name,
    required this.nameAr,
    required this.nameEn,
    required this.price,
    required this.details,
    required this.detailsAr,
    required this.detailsEn,
  });

  factory FixedPackageDataModel.fromJson(Map<String, dynamic> json) =>
      _$FixedPackageDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$FixedPackageDataModelToJson(this);
}
