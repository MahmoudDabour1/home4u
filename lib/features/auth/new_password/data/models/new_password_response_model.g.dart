// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_password_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewPasswordResponseModel _$NewPasswordResponseModelFromJson(
        Map<String, dynamic> json) =>
    NewPasswordResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] as String?,
    );

Map<String, dynamic> _$NewPasswordResponseModelToJson(
        NewPasswordResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };
