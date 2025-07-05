// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_design_asks_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestDesignAsksResponseModel _$RequestDesignAsksResponseModelFromJson(
        Map<String, dynamic> json) =>
    RequestDesignAsksResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => RequestDesignAskData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RequestDesignAsksResponseModelToJson(
        RequestDesignAsksResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

RequestDesignAskData _$RequestDesignAskDataFromJson(
        Map<String, dynamic> json) =>
    RequestDesignAskData(
      id: (json['id'] as num?)?.toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      phoneNumber: json['phoneNumber'] as String?,
      unitType: json['unitType'] == null
          ? null
          : BaseTypeModel.fromJson(json['unitType'] as Map<String, dynamic>),
      governorate: json['governorate'] == null
          ? null
          : CityBaseModel.fromJson(json['governorate'] as Map<String, dynamic>),
      unitArea: (json['unitArea'] as num?)?.toInt(),
      budget: (json['budget'] as num?)?.toInt(),
      requiredDuration: (json['requiredDuration'] as num?)?.toInt(),
      notes: json['notes'] as String?,
      user: json['user'] == null
          ? null
          : UserBaseModel.fromJson(json['user'] as Map<String, dynamic>),
      requestCount: (json['requestCount'] as num?)?.toInt(),
      askStatus: json['askStatus'] as String?,
    );

Map<String, dynamic> _$RequestDesignAskDataToJson(
        RequestDesignAskData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'unitType': instance.unitType,
      'governorate': instance.governorate,
      'unitArea': instance.unitArea,
      'budget': instance.budget,
      'requiredDuration': instance.requiredDuration,
      'notes': instance.notes,
      'user': instance.user,
      'requestCount': instance.requestCount,
      'askStatus': instance.askStatus,
    };
