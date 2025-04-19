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
          unitType:
              CustomPackage.fromJson(json['unitType'] as Map<String, dynamic>),
          customPackage: CustomPackage.fromJson(
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

CustomPackage _$CustomPackageFromJson(Map<String, dynamic> json) =>
    CustomPackage(
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$CustomPackageToJson(CustomPackage instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
