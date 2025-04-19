// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_renovate_house_custom_package_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRenovateHouseCustomPackageBody _$AddRenovateHouseCustomPackageBodyFromJson(
        Map<String, dynamic> json) =>
    AddRenovateHouseCustomPackageBody(
      phoneNumber: json['phoneNumber'] as String,
      isInsideCompound: json['isInsideCompound'] as bool,
      unitType: ItemId.fromJson(json['unitType'] as Map<String, dynamic>),
      unitStatuses:
          ItemId.fromJson(json['unitStatuses'] as Map<String, dynamic>),
      unitWorkTypes:
          ItemId.fromJson(json['unitWorkTypes'] as Map<String, dynamic>),
      workSkills: ItemId.fromJson(json['workSkills'] as Map<String, dynamic>),
      city: ItemId.fromJson(json['city'] as Map<String, dynamic>),
      governorate: ItemId.fromJson(json['governorate'] as Map<String, dynamic>),
      unitArea: (json['unitArea'] as num).toInt(),
      budget: (json['budget'] as num).toInt(),
      region: (json['region'] as num).toInt(),
      numberOfRooms: (json['numberOfRooms'] as num).toInt(),
      numberOfBathrooms: (json['numberOfBathrooms'] as num).toInt(),
      requiredDuration: (json['requiredDuration'] as num).toInt(),
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$AddRenovateHouseCustomPackageBodyToJson(
        AddRenovateHouseCustomPackageBody instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'isInsideCompound': instance.isInsideCompound,
      'unitType': instance.unitType,
      'unitStatuses': instance.unitStatuses,
      'unitWorkTypes': instance.unitWorkTypes,
      'workSkills': instance.workSkills,
      'city': instance.city,
      'governorate': instance.governorate,
      'unitArea': instance.unitArea,
      'budget': instance.budget,
      'region': instance.region,
      'numberOfRooms': instance.numberOfRooms,
      'numberOfBathrooms': instance.numberOfBathrooms,
      'requiredDuration': instance.requiredDuration,
      'notes': instance.notes,
    };

ItemId _$ItemIdFromJson(Map<String, dynamic> json) => ItemId(
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$ItemIdToJson(ItemId instance) => <String, dynamic>{
      'id': instance.id,
    };
