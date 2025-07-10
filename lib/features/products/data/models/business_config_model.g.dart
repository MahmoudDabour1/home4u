// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_config_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BusinessConfigModelAdapter extends TypeAdapter<BusinessConfigModel> {
  @override
  final int typeId = 50;

  @override
  BusinessConfigModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BusinessConfigModel(
      success: fields[0] as bool?,
      status: fields[1] as int?,
      data: fields[2] as BusinessConfigData?,
    );
  }

  @override
  void write(BinaryWriter writer, BusinessConfigModel obj) {
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
      other is BusinessConfigModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BusinessConfigDataAdapter extends TypeAdapter<BusinessConfigData> {
  @override
  final int typeId = 51;

  @override
  BusinessConfigData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BusinessConfigData(
      colors: (fields[0] as List?)?.cast<FilterColor>(),
      productBaseUnits: (fields[1] as List?)?.cast<ProductBaseUnit>(),
      productMaterial: (fields[2] as List?)?.cast<ProductMaterial>(),
      businessTypes: (fields[3] as List?)?.cast<BusinessType>(),
      businessTypeCategories: (fields[4] as List?)?.cast<BusinessType>(),
      homeFurnishingRequestTypes: (fields[5] as List?)?.cast<DevicesAttached>(),
      furnitureTypes: (fields[6] as List?)?.cast<DevicesAttached>(),
      devicesAttacheds: (fields[7] as List?)?.cast<DevicesAttached>(),
      kitchenTypes: (fields[8] as List?)?.cast<DevicesAttached>(),
    );
  }

  @override
  void write(BinaryWriter writer, BusinessConfigData obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.colors)
      ..writeByte(1)
      ..write(obj.productBaseUnits)
      ..writeByte(2)
      ..write(obj.productMaterial)
      ..writeByte(3)
      ..write(obj.businessTypes)
      ..writeByte(4)
      ..write(obj.businessTypeCategories)
      ..writeByte(5)
      ..write(obj.homeFurnishingRequestTypes)
      ..writeByte(6)
      ..write(obj.furnitureTypes)
      ..writeByte(7)
      ..write(obj.devicesAttacheds)
      ..writeByte(8)
      ..write(obj.kitchenTypes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BusinessConfigDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FilterColorAdapter extends TypeAdapter<FilterColor> {
  @override
  final int typeId = 52;

  @override
  FilterColor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FilterColor(
      id: fields[0] as int?,
      code: fields[1] as String?,
      name: fields[2] as String?,
      hexColor: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FilterColor obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.hexColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilterColorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductBaseUnitAdapter extends TypeAdapter<ProductBaseUnit> {
  @override
  final int typeId = 53;

  @override
  ProductBaseUnit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductBaseUnit(
      id: fields[0] as int?,
      code: fields[1] as String?,
      name: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductBaseUnit obj) {
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
      other is ProductBaseUnitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductMaterialAdapter extends TypeAdapter<ProductMaterial> {
  @override
  final int typeId = 54;

  @override
  ProductMaterial read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductMaterial(
      id: fields[0] as int?,
      code: fields[1] as String?,
      name: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductMaterial obj) {
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
      other is ProductMaterialAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BusinessTypeAdapter extends TypeAdapter<BusinessType> {
  @override
  final int typeId = 55;

  @override
  BusinessType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BusinessType(
      id: fields[0] as int?,
      code: fields[1] as String?,
      name: fields[2] as String?,
      businessType: fields[3] as BusinessType?,
    );
  }

  @override
  void write(BinaryWriter writer, BusinessType obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.businessType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BusinessTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DevicesAttachedAdapter extends TypeAdapter<DevicesAttached> {
  @override
  final int typeId = 56;

  @override
  DevicesAttached read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DevicesAttached(
      id: fields[0] as int?,
      code: fields[1] as String?,
      name: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DevicesAttached obj) {
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
      other is DevicesAttachedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessConfigModel _$BusinessConfigModelFromJson(Map<String, dynamic> json) =>
    BusinessConfigModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : BusinessConfigData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BusinessConfigModelToJson(
        BusinessConfigModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

BusinessConfigData _$BusinessConfigDataFromJson(Map<String, dynamic> json) =>
    BusinessConfigData(
      colors: (json['colors'] as List<dynamic>?)
          ?.map((e) => FilterColor.fromJson(e as Map<String, dynamic>))
          .toList(),
      productBaseUnits: (json['productBaseUnits'] as List<dynamic>?)
          ?.map((e) => ProductBaseUnit.fromJson(e as Map<String, dynamic>))
          .toList(),
      productMaterial: (json['productMaterial'] as List<dynamic>?)
          ?.map((e) => ProductMaterial.fromJson(e as Map<String, dynamic>))
          .toList(),
      businessTypes: (json['businessTypes'] as List<dynamic>?)
          ?.map((e) => BusinessType.fromJson(e as Map<String, dynamic>))
          .toList(),
      businessTypeCategories: (json['businessTypeCategories'] as List<dynamic>?)
          ?.map((e) => BusinessType.fromJson(e as Map<String, dynamic>))
          .toList(),
      homeFurnishingRequestTypes:
          (json['homeFurnishingRequestTypes'] as List<dynamic>?)
              ?.map((e) => DevicesAttached.fromJson(e as Map<String, dynamic>))
              .toList(),
      furnitureTypes: (json['furnitureTypes'] as List<dynamic>?)
          ?.map((e) => DevicesAttached.fromJson(e as Map<String, dynamic>))
          .toList(),
      devicesAttacheds: (json['devicesAttacheds'] as List<dynamic>?)
          ?.map((e) => DevicesAttached.fromJson(e as Map<String, dynamic>))
          .toList(),
      kitchenTypes: (json['kitchenTypes'] as List<dynamic>?)
          ?.map((e) => DevicesAttached.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BusinessConfigDataToJson(BusinessConfigData instance) =>
    <String, dynamic>{
      'colors': instance.colors,
      'productBaseUnits': instance.productBaseUnits,
      'productMaterial': instance.productMaterial,
      'businessTypes': instance.businessTypes,
      'businessTypeCategories': instance.businessTypeCategories,
      'homeFurnishingRequestTypes': instance.homeFurnishingRequestTypes,
      'furnitureTypes': instance.furnitureTypes,
      'devicesAttacheds': instance.devicesAttacheds,
      'kitchenTypes': instance.kitchenTypes,
    };

FilterColor _$FilterColorFromJson(Map<String, dynamic> json) => FilterColor(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      hexColor: json['hexColor'] as String?,
    );

Map<String, dynamic> _$FilterColorToJson(FilterColor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'hexColor': instance.hexColor,
    };

ProductBaseUnit _$ProductBaseUnitFromJson(Map<String, dynamic> json) =>
    ProductBaseUnit(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProductBaseUnitToJson(ProductBaseUnit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };

ProductMaterial _$ProductMaterialFromJson(Map<String, dynamic> json) =>
    ProductMaterial(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProductMaterialToJson(ProductMaterial instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };

BusinessType _$BusinessTypeFromJson(Map<String, dynamic> json) => BusinessType(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      businessType: json['businessType'] == null
          ? null
          : BusinessType.fromJson(json['businessType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BusinessTypeToJson(BusinessType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'businessType': instance.businessType,
    };

DevicesAttached _$DevicesAttachedFromJson(Map<String, dynamic> json) =>
    DevicesAttached(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DevicesAttachedToJson(DevicesAttached instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };
