// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_certification_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCertificationResponseModel _$AddCertificationResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddCertificationResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : AddCertificationResponseData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddCertificationResponseModelToJson(
        AddCertificationResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

AddCertificationResponseData _$AddCertificationResponseDataFromJson(
        Map<String, dynamic> json) =>
    AddCertificationResponseData(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      imagePath: json['path'] as String?,
    )..statusCode = (json['statusCode'] as num?)?.toInt();

Map<String, dynamic> _$AddCertificationResponseDataToJson(
        AddCertificationResponseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'name': instance.name,
      'description': instance.description,
      'path': instance.imagePath,
    };
