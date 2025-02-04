// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_projects_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetProjectsResponseModelAdapter
    extends TypeAdapter<GetProjectsResponseModel> {
  @override
  final int typeId = 10;

  @override
  GetProjectsResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetProjectsResponseModel(
      success: fields[0] as bool?,
      status: fields[1] as int?,
      data: (fields[2] as List?)?.cast<ProjectsData>(),
    );
  }

  @override
  void write(BinaryWriter writer, GetProjectsResponseModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.success)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetProjectsResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProjectsDataAdapter extends TypeAdapter<ProjectsData> {
  @override
  final int typeId = 11;

  @override
  ProjectsData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProjectsData(
      id: fields[0] as int?,
      statusCode: fields[1] as int?,
      name: fields[2] as String?,
      description: fields[3] as String?,
      startDate: fields[4] as DateTime?,
      endDate: fields[5] as DateTime?,
      tools: fields[6] as String?,
      coverPath: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProjectsData obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.statusCode)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.startDate)
      ..writeByte(5)
      ..write(obj.endDate)
      ..writeByte(6)
      ..write(obj.tools)
      ..writeByte(7)
      ..write(obj.coverPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectsDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
