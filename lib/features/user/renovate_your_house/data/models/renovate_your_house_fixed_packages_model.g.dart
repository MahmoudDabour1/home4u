// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renovate_your_house_fixed_packages_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RenovateYourHouseFixedPackagesModelAdapter
    extends TypeAdapter<RenovateYourHouseFixedPackagesModel> {
  @override
  final int typeId = 99;

  @override
  RenovateYourHouseFixedPackagesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RenovateYourHouseFixedPackagesModel(
      success: fields[1] as bool,
      status: fields[3] as int,
      data: (fields[5] as List).cast<FixedPackageDataModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, RenovateYourHouseFixedPackagesModel obj) {
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
      other is RenovateYourHouseFixedPackagesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FixedPackageDataModelAdapter extends TypeAdapter<FixedPackageDataModel> {
  @override
  final int typeId = 100;

  @override
  FixedPackageDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FixedPackageDataModel(
      id: fields[1] as int,
      statusCode: fields[3] as int,
      name: fields[5] as String,
      nameAr: fields[7] as String,
      nameEn: fields[9] as String,
      price: fields[11] as int,
      details: fields[13] as String,
      detailsAr: fields[15] as String,
      detailsEn: fields[17] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FixedPackageDataModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.statusCode)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.nameAr)
      ..writeByte(9)
      ..write(obj.nameEn)
      ..writeByte(11)
      ..write(obj.price)
      ..writeByte(13)
      ..write(obj.details)
      ..writeByte(15)
      ..write(obj.detailsAr)
      ..writeByte(17)
      ..write(obj.detailsEn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FixedPackageDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RenovateYourHouseFixedPackagesModel
    _$RenovateYourHouseFixedPackagesModelFromJson(Map<String, dynamic> json) =>
        RenovateYourHouseFixedPackagesModel(
          success: json['success'] as bool,
          status: (json['status'] as num).toInt(),
          data: (json['data'] as List<dynamic>)
              .map((e) =>
                  FixedPackageDataModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$RenovateYourHouseFixedPackagesModelToJson(
        RenovateYourHouseFixedPackagesModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

FixedPackageDataModel _$FixedPackageDataModelFromJson(
        Map<String, dynamic> json) =>
    FixedPackageDataModel(
      id: (json['id'] as num).toInt(),
      statusCode: (json['statusCode'] as num).toInt(),
      name: json['name'] as String,
      nameAr: json['nameAr'] as String,
      nameEn: json['nameEn'] as String,
      price: (json['price'] as num).toInt(),
      details: json['details'] as String,
      detailsAr: json['detailsAr'] as String,
      detailsEn: json['detailsEn'] as String,
    );

Map<String, dynamic> _$FixedPackageDataModelToJson(
        FixedPackageDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'name': instance.name,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
      'price': instance.price,
      'details': instance.details,
      'detailsAr': instance.detailsAr,
      'detailsEn': instance.detailsEn,
    };
