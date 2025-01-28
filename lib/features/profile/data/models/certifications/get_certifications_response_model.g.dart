// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_certifications_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCertificationsResponseModel _$GetCertificationsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetCertificationsResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CertificationsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCertificationsResponseModelToJson(
        GetCertificationsResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

CertificationsData _$CertificationsDataFromJson(Map<String, dynamic> json) =>
    CertificationsData(
      id: (json['id'] as num?)?.toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      imagePath: json['path'] as String?,
    );

Map<String, dynamic> _$CertificationsDataToJson(CertificationsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'name': instance.name,
      'description': instance.description,
      'path': instance.imagePath,
    };
