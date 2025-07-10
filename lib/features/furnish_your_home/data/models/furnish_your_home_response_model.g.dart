// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'furnish_your_home_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FurnishYourHomeResponseModel _$FurnishYourHomeResponseModelFromJson(
        Map<String, dynamic> json) =>
    FurnishYourHomeResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FurnishYourHomeResponseModelToJson(
        FurnishYourHomeResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      requestType: json['requestType'] == null
          ? null
          : FurnitureType.fromJson(json['requestType'] as Map<String, dynamic>),
      phoneNumber: json['phoneNumber'] as String?,
      government: json['government'] == null
          ? null
          : FurnitureType.fromJson(json['government'] as Map<String, dynamic>),
      timeFrameDays: (json['timeFrameDays'] as num?)?.toInt(),
      budget: (json['budget'] as num?)?.toInt(),
      attachmentFileUrl: json['attachmentFileUrl'],
      note: json['note'] as String?,
      productMaterial: json['productMaterial'],
      kitchenType: json['kitchenType'],
      devicesAttacheds: json['devicesAttacheds'],
      kitchenSize: json['kitchenSize'],
      furnitureType: json['furnitureType'] == null
          ? null
          : FurnitureType.fromJson(
              json['furnitureType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'requestType': instance.requestType,
      'phoneNumber': instance.phoneNumber,
      'government': instance.government,
      'timeFrameDays': instance.timeFrameDays,
      'budget': instance.budget,
      'attachmentFileUrl': instance.attachmentFileUrl,
      'note': instance.note,
      'productMaterial': instance.productMaterial,
      'kitchenType': instance.kitchenType,
      'devicesAttacheds': instance.devicesAttacheds,
      'kitchenSize': instance.kitchenSize,
      'furnitureType': instance.furnitureType,
    };

FurnitureType _$FurnitureTypeFromJson(Map<String, dynamic> json) =>
    FurnitureType(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'],
      name: json['name'],
    );

Map<String, dynamic> _$FurnitureTypeToJson(FurnitureType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };
