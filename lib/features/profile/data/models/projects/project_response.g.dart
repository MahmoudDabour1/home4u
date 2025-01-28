// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectResponse _$ProjectResponseFromJson(Map<String, dynamic> json) =>
    ProjectResponse(
      success: json['success'] as bool,
      status: (json['status'] as num).toInt(),
      data: ProjectDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProjectResponseToJson(ProjectResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

ProjectDataResponse _$ProjectDataResponseFromJson(Map<String, dynamic> json) =>
    ProjectDataResponse(
      id: (json['id'] as num).toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      tools: json['tools'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Image.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectDataResponseToJson(
        ProjectDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'name': instance.name,
      'description': instance.description,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'tools': instance.tools,
      'images': instance.images,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      id: (json['id'] as num).toInt(),
      path: json['path'] as String,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
    };
