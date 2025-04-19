import 'package:freezed_annotation/freezed_annotation.dart';

part 'renovate_your_house_choose_fixed_package_body.g.dart';

@JsonSerializable()
class RenovateYourHouseChooseFixedPackageBody {
  @JsonKey(name: "phoneNumber")
  final String phoneNumber;
  @JsonKey(name: "isInsideCompound")
  final bool isInsideCompound;
  @JsonKey(name: "unitType")
  final CustomPackage unitType;
  @JsonKey(name: "customPackage")
  final CustomPackage customPackage;

  RenovateYourHouseChooseFixedPackageBody({
    required this.phoneNumber,
    required this.isInsideCompound,
    required this.unitType,
    required this.customPackage,
  });

  factory RenovateYourHouseChooseFixedPackageBody.fromJson(
          Map<String, dynamic> json) =>
      _$RenovateYourHouseChooseFixedPackageBodyFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RenovateYourHouseChooseFixedPackageBodyToJson(this);
}

@JsonSerializable()
class CustomPackage {
  @JsonKey(name: "id")
  final int id;

  CustomPackage({
    required this.id,
  });

  factory CustomPackage.fromJson(Map<String, dynamic> json) =>
      _$CustomPackageFromJson(json);

  Map<String, dynamic> toJson() => _$CustomPackageToJson(this);
}
