// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renovate_your_house_look_ups_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RenovateYourHouseLookUpsModelAdapter
    extends TypeAdapter<RenovateYourHouseLookUpsModel> {
  @override
  final int typeId = 95;

  @override
  RenovateYourHouseLookUpsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RenovateYourHouseLookUpsModel(
      success: fields[1] as bool,
      status: fields[3] as int,
      data: fields[5] as Data,
    );
  }

  @override
  void write(BinaryWriter writer, RenovateYourHouseLookUpsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.success)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RenovateYourHouseLookUpsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 2;

  @override
  Data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Data(
      unitTypes: (fields[1] as List).cast<UnitStatus>(),
      unitStatuses: (fields[3] as List).cast<UnitStatus>(),
      unitWorkTypes: (fields[5] as List).cast<UnitStatus>(),
      workSkills: (fields[7] as List).cast<UnitStatus>(),
      governorates: (fields[9] as List).cast<Governorate>(),
    );
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.unitTypes)
      ..writeByte(3)
      ..write(obj.unitStatuses)
      ..writeByte(5)
      ..write(obj.unitWorkTypes)
      ..writeByte(7)
      ..write(obj.workSkills)
      ..writeByte(9)
      ..write(obj.governorates);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GovernorateAdapter extends TypeAdapter<Governorate> {
  @override
  final int typeId = 3;

  @override
  Governorate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Governorate(
      id: fields[1] as int,
      code: fields[3] as String,
      name: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Governorate obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.code)
      ..writeByte(5)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GovernorateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UnitStatusAdapter extends TypeAdapter<UnitStatus> {
  @override
  final int typeId = 4;

  @override
  UnitStatus read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnitStatus(
      id: fields[1] as int,
      code: fields[3] as String,
      name: fields[5] as String,
      nameAr: fields[7] as String,
      nameEn: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UnitStatus obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.code)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.nameAr)
      ..writeByte(9)
      ..write(obj.nameEn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnitStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RenovateYourHouseLookUpsModel _$RenovateYourHouseLookUpsModelFromJson(
        Map<String, dynamic> json) =>
    RenovateYourHouseLookUpsModel(
      success: json['success'] as bool,
      status: (json['status'] as num).toInt(),
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RenovateYourHouseLookUpsModelToJson(
        RenovateYourHouseLookUpsModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      unitTypes: (json['unitTypes'] as List<dynamic>)
          .map((e) => UnitStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      unitStatuses: (json['unitStatuses'] as List<dynamic>)
          .map((e) => UnitStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      unitWorkTypes: (json['unitWorkTypes'] as List<dynamic>)
          .map((e) => UnitStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      workSkills: (json['workSkills'] as List<dynamic>)
          .map((e) => UnitStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      governorates: (json['governorates'] as List<dynamic>)
          .map((e) => Governorate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'unitTypes': instance.unitTypes,
      'unitStatuses': instance.unitStatuses,
      'unitWorkTypes': instance.unitWorkTypes,
      'workSkills': instance.workSkills,
      'governorates': instance.governorates,
    };

Governorate _$GovernorateFromJson(Map<String, dynamic> json) => Governorate(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$GovernorateToJson(Governorate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };

UnitStatus _$UnitStatusFromJson(Map<String, dynamic> json) => UnitStatus(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String,
      nameAr: json['nameAr'] as String,
      nameEn: json['nameEn'] as String,
    );

Map<String, dynamic> _$UnitStatusToJson(UnitStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
    };
