// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'governorate_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GovernorateModelAdapter extends TypeAdapter<GovernorateModel> {
  @override
  final int typeId = 1;

  @override
  GovernorateModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GovernorateModel(
      data: (fields[0] as List).cast<GovernorateDataModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, GovernorateModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GovernorateModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GovernorateDataModelAdapter extends TypeAdapter<GovernorateDataModel> {
  @override
  final int typeId = 0;

  @override
  GovernorateDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GovernorateDataModel(
      id: fields[0] as int,
      code: fields[1] as String,
      name: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GovernorateDataModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GovernorateDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GovernorateModel _$GovernorateModelFromJson(Map<String, dynamic> json) =>
    GovernorateModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => GovernorateDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GovernorateModelToJson(GovernorateModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

GovernorateDataModel _$GovernorateDataModelFromJson(
        Map<String, dynamic> json) =>
    GovernorateDataModel(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$GovernorateDataModelToJson(
        GovernorateDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };
