// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordResponseModel _$ForgetPasswordResponseModelFromJson(
        Map<String, dynamic> json) =>
    ForgetPasswordResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] as String?,
    );

Map<String, dynamic> _$ForgetPasswordResponseModelToJson(
        ForgetPasswordResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };
