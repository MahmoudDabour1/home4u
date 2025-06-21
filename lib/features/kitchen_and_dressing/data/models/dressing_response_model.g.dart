// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dressing_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DressingResponseModel _$DressingResponseModelFromJson(
        Map<String, dynamic> json) =>
    DressingResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DressingResponseModelToJson(
        DressingResponseModel instance) =>
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
          : Government.fromJson(json['requestType'] as Map<String, dynamic>),
      phoneNumber: json['phoneNumber'] as String?,
      government: json['government'] == null
          ? null
          : Government.fromJson(json['government'] as Map<String, dynamic>),
      timeFrameDays: (json['timeFrameDays'] as num?)?.toInt(),
      budget: (json['budget'] as num?)?.toInt(),
      attachmentFileUrl: json['attachmentFileUrl'],
      note: json['note'] as String?,
      productMaterial: (json['productMaterial'] as List<dynamic>?)
          ?.map((e) => Government.fromJson(e as Map<String, dynamic>))
          .toList(),
      kitchenType: json['kitchenType'],
      devicesAttacheds: json['devicesAttacheds'],
      kitchenSize: json['kitchenSize'],
      furnitureType: json['furnitureType'],
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

Government _$GovernmentFromJson(Map<String, dynamic> json) => Government(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'],
      name: json['name'],
    );

Map<String, dynamic> _$GovernmentToJson(Government instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };
