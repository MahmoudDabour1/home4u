// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renovate_your_house_choose_fixed_package_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RenovateYourHouseChooseFixedPackageBody
    _$RenovateYourHouseChooseFixedPackageBodyFromJson(
            Map<String, dynamic> json) =>
        RenovateYourHouseChooseFixedPackageBody(
          phoneNumber: json['phoneNumber'] as String,
          isInsideCompound: json['isInsideCompound'] as bool,
          unitType: RenovateCustomPackageBody.fromJson(
              json['unitType'] as Map<String, dynamic>),
          customPackage: RenovateCustomPackageBody.fromJson(
              json['customPackage'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RenovateYourHouseChooseFixedPackageBodyToJson(
        RenovateYourHouseChooseFixedPackageBody instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'isInsideCompound': instance.isInsideCompound,
      'unitType': instance.unitType,
      'customPackage': instance.customPackage,
    };

RenovateCustomPackageBody _$RenovateCustomPackageBodyFromJson(
        Map<String, dynamic> json) =>
    RenovateCustomPackageBody(
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$RenovateCustomPackageBodyToJson(
        RenovateCustomPackageBody instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
