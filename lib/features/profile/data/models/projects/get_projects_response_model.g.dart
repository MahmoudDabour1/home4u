// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_projects_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProjectsResponseModel _$GetProjectsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetProjectsResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProjectsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetProjectsResponseModelToJson(
        GetProjectsResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

ProjectsData _$ProjectsDataFromJson(Map<String, dynamic> json) => ProjectsData(
      id: (json['id'] as num?)?.toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      tools: json['tools'] as String?,
      coverPath: json['coverPath'] as String?,
    );

Map<String, dynamic> _$ProjectsDataToJson(ProjectsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'name': instance.name,
      'description': instance.description,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'tools': instance.tools,
      'coverPath': instance.coverPath,
    };
