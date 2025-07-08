// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renovate_house_asks_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RenovateHouseAsksResponseModel _$RenovateHouseAsksResponseModelFromJson(
        Map<String, dynamic> json) =>
    RenovateHouseAsksResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => RenovateHouseAskData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RenovateHouseAsksResponseModelToJson(
        RenovateHouseAsksResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

RenovateHouseAskData _$RenovateHouseAskDataFromJson(
        Map<String, dynamic> json) =>
    RenovateHouseAskData(
      id: (json['id'] as num?)?.toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      user: json['user'] == null
          ? null
          : UserBaseModel.fromJson(json['user'] as Map<String, dynamic>),
      phoneNumber: json['phoneNumber'] as String?,
      isInsideCompound: json['isInsideCompound'] as bool?,
      unitType: json['unitType'] == null
          ? null
          : BaseTypeModel.fromJson(json['unitType'] as Map<String, dynamic>),
      unitStatuses: json['unitStatuses'] == null
          ? null
          : BaseTypeModel.fromJson(
              json['unitStatuses'] as Map<String, dynamic>),
      unitWorkTypes: json['unitWorkTypes'] == null
          ? null
          : BaseTypeModel.fromJson(
              json['unitWorkTypes'] as Map<String, dynamic>),
      workSkills: json['workSkills'] == null
          ? null
          : BaseTypeModel.fromJson(json['workSkills'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : CityBaseModel.fromJson(json['city'] as Map<String, dynamic>),
      governorate: json['governorate'] == null
          ? null
          : CityBaseModel.fromJson(json['governorate'] as Map<String, dynamic>),
      unitArea: (json['unitArea'] as num?)?.toInt(),
      budget: (json['budget'] as num?)?.toInt(),
      region: (json['region'] as num?)?.toInt(),
      numberOfRooms: (json['numberOfRooms'] as num?)?.toInt(),
      numberOfBathrooms: (json['numberOfBathrooms'] as num?)?.toInt(),
      requiredDuration: (json['requiredDuration'] as num?)?.toInt(),
      notes: json['notes'] as String?,
      requestCount: (json['requestCount'] as num?)?.toInt(),
      askStatus: (json['askStatus'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RenovateHouseAskDataToJson(
        RenovateHouseAskData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'user': instance.user,
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
      'requestCount': instance.requestCount,
      'askStatus': instance.askStatus,
    };
