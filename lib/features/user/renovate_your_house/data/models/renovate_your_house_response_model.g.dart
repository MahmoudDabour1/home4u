// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renovate_your_house_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RenovateYourHouseResponseModel _$RenovateYourHouseResponseModelFromJson(
        Map<String, dynamic> json) =>
    RenovateYourHouseResponseModel(
      success: json['success'] as bool,
      status: (json['status'] as num).toInt(),
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RenovateYourHouseResponseModelToJson(
        RenovateYourHouseResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num).toInt(),
      statusCode: (json['statusCode'] as num).toInt(),
      phoneNumber: json['phoneNumber'] as String,
      isInsideCompound: json['isInsideCompound'] as bool,
      unitType: UnitStatuses.fromJson(json['unitType'] as Map<String, dynamic>),
      unitStatuses:
          UnitStatuses.fromJson(json['unitStatuses'] as Map<String, dynamic>),
      unitWorkTypes:
          UnitStatuses.fromJson(json['unitWorkTypes'] as Map<String, dynamic>),
      workSkills:
          UnitStatuses.fromJson(json['workSkills'] as Map<String, dynamic>),
      city: City.fromJson(json['city'] as Map<String, dynamic>),
      governorate: City.fromJson(json['governorate'] as Map<String, dynamic>),
      unitArea: (json['unitArea'] as num).toInt(),
      budget: (json['budget'] as num).toInt(),
      region: (json['region'] as num).toInt(),
      numberOfRooms: (json['numberOfRooms'] as num).toInt(),
      numberOfBathrooms: (json['numberOfBathrooms'] as num).toInt(),
      requiredDuration: (json['requiredDuration'] as num).toInt(),
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
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

City _$CityFromJson(Map<String, dynamic> json) => City(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };

UnitStatuses _$UnitStatusesFromJson(Map<String, dynamic> json) => UnitStatuses(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String,
      nameAr: json['nameAr'] as String,
      nameEn: json['nameEn'] as String,
    );

Map<String, dynamic> _$UnitStatusesToJson(UnitStatuses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
    };
