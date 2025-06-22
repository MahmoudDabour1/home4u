// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technical_worker_profile_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TechnicalWorkerResponseModelAdapter
    extends TypeAdapter<TechnicalWorkerResponseModel> {
  @override
  final int typeId = 75;

  @override
  TechnicalWorkerResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TechnicalWorkerResponseModel(
      success: fields[0] as bool?,
      status: fields[1] as int?,
      data: fields[2] as TechnicalData?,
    );
  }

  @override
  void write(BinaryWriter writer, TechnicalWorkerResponseModel obj) {
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
      other is TechnicalWorkerResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TechnicalDataAdapter extends TypeAdapter<TechnicalData> {
  @override
  final int typeId = 76;

  @override
  TechnicalData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TechnicalData(
      id: fields[0] as int?,
      statusCode: fields[1] as int?,
      user: fields[2] as FreeLancerUser?,
      type: fields[3] as FreeLancerType?,
      yearsOfExperience: fields[4] as int?,
      workerServs: (fields[5] as List?)?.cast<FreeLancerType>(),
      bio: fields[6] as String?,
      linkedin: fields[7] as String?,
      behance: fields[8] as String?,
      facebookLink: fields[9] as String?,
      averageRate: fields[10] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, TechnicalData obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.statusCode)
      ..writeByte(2)
      ..write(obj.user)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.yearsOfExperience)
      ..writeByte(5)
      ..write(obj.workerServs)
      ..writeByte(6)
      ..write(obj.bio)
      ..writeByte(7)
      ..write(obj.linkedin)
      ..writeByte(8)
      ..write(obj.behance)
      ..writeByte(9)
      ..write(obj.facebookLink)
      ..writeByte(10)
      ..write(obj.averageRate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TechnicalDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TechnicalWorkerResponseModel _$TechnicalWorkerResponseModelFromJson(
        Map<String, dynamic> json) =>
    TechnicalWorkerResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : TechnicalData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TechnicalWorkerResponseModelToJson(
        TechnicalWorkerResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

TechnicalData _$TechnicalDataFromJson(Map<String, dynamic> json) =>
    TechnicalData(
      id: (json['id'] as num?)?.toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : FreeLancerUser.fromJson(json['user'] as Map<String, dynamic>),
      type: json['type'] == null
          ? null
          : FreeLancerType.fromJson(json['type'] as Map<String, dynamic>),
      yearsOfExperience: (json['yearsOfExperience'] as num?)?.toInt(),
      workerServs: (json['workerServs'] as List<dynamic>?)
          ?.map((e) => FreeLancerType.fromJson(e as Map<String, dynamic>))
          .toList(),
      bio: json['bio'] as String?,
      linkedin: json['linkedinLink'] as String?,
      behance: json['behanceLink'] as String?,
      facebookLink: json['facebookLink'] as String?,
      averageRate: (json['averageRate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TechnicalDataToJson(TechnicalData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'user': instance.user,
      'type': instance.type,
      'yearsOfExperience': instance.yearsOfExperience,
      'workerServs': instance.workerServs,
      'bio': instance.bio,
      'linkedinLink': instance.linkedin,
      'behanceLink': instance.behance,
      'facebookLink': instance.facebookLink,
      'averageRate': instance.averageRate,
    };
