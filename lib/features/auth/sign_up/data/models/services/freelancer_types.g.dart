// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freelancer_types.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FreelancerTypesAdapter extends TypeAdapter<FreelancerTypes> {
  @override
  final int typeId = 11;

  @override
  FreelancerTypes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FreelancerTypes(
      data: (fields[0] as List).cast<FreelancerTypeData>(),
    );
  }

  @override
  void write(BinaryWriter writer, FreelancerTypes obj) {
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
      other is FreelancerTypesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FreelancerTypeDataAdapter extends TypeAdapter<FreelancerTypeData> {
  @override
  final int typeId = 10;

  @override
  FreelancerTypeData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FreelancerTypeData(
      id: fields[0] as int,
      code: fields[1] as String,
      name: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FreelancerTypeData obj) {
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
      other is FreelancerTypeDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FreelancerTypes _$FreelancerTypesFromJson(Map<String, dynamic> json) =>
    FreelancerTypes(
      data: (json['data'] as List<dynamic>)
          .map((e) => FreelancerTypeData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FreelancerTypesToJson(FreelancerTypes instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

FreelancerTypeData _$FreelancerTypeDataFromJson(Map<String, dynamic> json) =>
    FreelancerTypeData(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$FreelancerTypeDataToJson(FreelancerTypeData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };
