// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerificationResponseModel _$VerificationResponseModelFromJson(
        Map<String, dynamic> json) =>
    VerificationResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] as String?,
    );

Map<String, dynamic> _$VerificationResponseModelToJson(
        VerificationResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };
