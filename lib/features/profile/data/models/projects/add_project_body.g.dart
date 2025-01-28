// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_project_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProjectBody _$AddProjectBodyFromJson(Map<String, dynamic> json) =>
    AddProjectBody(
      name: json['name'] as String,
      description: json['description'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      tools: json['tools'] as String,
    );

Map<String, dynamic> _$AddProjectBodyToJson(AddProjectBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'tools': instance.tools,
    };
