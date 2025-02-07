// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_profile_image_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadProfileImageResponseModel _$UploadProfileImageResponseModelFromJson(
        Map<String, dynamic> json) =>
    UploadProfileImageResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] as bool?,
    );

Map<String, dynamic> _$UploadProfileImageResponseModelToJson(
        UploadProfileImageResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };
