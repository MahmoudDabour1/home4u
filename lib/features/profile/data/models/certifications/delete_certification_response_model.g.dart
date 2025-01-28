// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_certification_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteCertificationResponseModel _$DeleteCertificationResponseModelFromJson(
        Map<String, dynamic> json) =>
    DeleteCertificationResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] as bool?,
    );

Map<String, dynamic> _$DeleteCertificationResponseModelToJson(
        DeleteCertificationResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };
