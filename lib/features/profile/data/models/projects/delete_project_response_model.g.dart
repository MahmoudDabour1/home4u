// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_project_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteProjectResponseModel _$DeleteProjectResponseModelFromJson(
        Map<String, dynamic> json) =>
    DeleteProjectResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] as bool?,
    );

Map<String, dynamic> _$DeleteProjectResponseModelToJson(
        DeleteProjectResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };
