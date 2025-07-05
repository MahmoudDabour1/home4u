// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engineer_asks_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EngineerAsksResponseModel _$EngineerAsksResponseModelFromJson(
        Map<String, dynamic> json) =>
    EngineerAsksResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => EngineerAskData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EngineerAsksResponseModelToJson(
        EngineerAsksResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

EngineerAskData _$EngineerAskDataFromJson(Map<String, dynamic> json) =>
    EngineerAskData(
      id: (json['id'] as num?)?.toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      phoneNumber: json['phoneNumber'] as String?,
      projectName: json['projectName'] as String?,
      projectDescription: json['projectDescription'] as String?,
      engineerType: json['engineerType'] == null
          ? null
          : BaseTypeModel.fromJson(
              json['engineerType'] as Map<String, dynamic>),
      unitType: json['unitType'] == null
          ? null
          : BaseTypeModel.fromJson(json['unitType'] as Map<String, dynamic>),
      budget: (json['budget'] as num?)?.toInt(),
      city: json['city'] == null
          ? null
          : CityBaseModel.fromJson(json['city'] as Map<String, dynamic>),
      governorate: json['governorate'] == null
          ? null
          : CityBaseModel.fromJson(json['governorate'] as Map<String, dynamic>),
      urgencyLevel: json['urgencyLevel'] == null
          ? null
          : BaseTypeModel.fromJson(
              json['urgencyLevel'] as Map<String, dynamic>),
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => PhotoBaseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] == null
          ? null
          : UserBaseModel.fromJson(json['user'] as Map<String, dynamic>),
      requestCount: (json['requestCount'] as num?)?.toInt(),
      askStatus: json['askStatus'] as String?,
    );

Map<String, dynamic> _$EngineerAskDataToJson(EngineerAskData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'projectName': instance.projectName,
      'projectDescription': instance.projectDescription,
      'engineerType': instance.engineerType,
      'unitType': instance.unitType,
      'budget': instance.budget,
      'city': instance.city,
      'governorate': instance.governorate,
      'urgencyLevel': instance.urgencyLevel,
      'deadline': instance.deadline?.toIso8601String(),
      'photos': instance.photos,
      'user': instance.user,
      'requestCount': instance.requestCount,
      'askStatus': instance.askStatus,
    };
