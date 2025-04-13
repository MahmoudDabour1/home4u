// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engineering_office_profile_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EngineeringOfficeProfileResponseModelAdapter
    extends TypeAdapter<EngineeringOfficeProfileResponseModel> {
  @override
  final int typeId = 90;

  @override
  EngineeringOfficeProfileResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EngineeringOfficeProfileResponseModel(
      success: fields[0] as bool?,
      status: fields[1] as int?,
      data: fields[2] as EngineeringOfficeData?,
    );
  }

  @override
  void write(BinaryWriter writer, EngineeringOfficeProfileResponseModel obj) {
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
      other is EngineeringOfficeProfileResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EngineeringOfficeDataAdapter extends TypeAdapter<EngineeringOfficeData> {
  @override
  final int typeId = 91;

  @override
  EngineeringOfficeData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EngineeringOfficeData(
      id: fields[0] as int?,
      statusCode: fields[1] as int?,
      user: fields[2] as EngineeringOfficeUser?,
      name: fields[3] as String?,
      description: fields[4] as String?,
      commercialRegisterPath: fields[5] as String?,
      taxCardPath: fields[6] as dynamic,
      personalCardPath: fields[7] as dynamic,
      engineeringOfficeField: fields[8] as EngineeringOffice?,
      engineeringOfficeDepartments:
          (fields[9] as List?)?.cast<EngineeringOffice>(),
    );
  }

  @override
  void write(BinaryWriter writer, EngineeringOfficeData obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.statusCode)
      ..writeByte(2)
      ..write(obj.user)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.commercialRegisterPath)
      ..writeByte(6)
      ..write(obj.taxCardPath)
      ..writeByte(7)
      ..write(obj.personalCardPath)
      ..writeByte(8)
      ..write(obj.engineeringOfficeField)
      ..writeByte(9)
      ..write(obj.engineeringOfficeDepartments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EngineeringOfficeDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EngineeringOfficeAdapter extends TypeAdapter<EngineeringOffice> {
  @override
  final int typeId = 92;

  @override
  EngineeringOffice read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EngineeringOffice(
      id: fields[0] as int?,
      code: fields[1] as String?,
      name: fields[2] as String?,
      nameAr: fields[3] as String?,
      nameEn: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, EngineeringOffice obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.nameAr)
      ..writeByte(4)
      ..write(obj.nameEn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EngineeringOfficeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EngineeringOfficeUserAdapter extends TypeAdapter<EngineeringOfficeUser> {
  @override
  final int typeId = 93;

  @override
  EngineeringOfficeUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EngineeringOfficeUser(
      id: fields[0] as int?,
      firstName: fields[1] as String?,
      lastName: fields[2] as String?,
      email: fields[3] as String?,
      phone: fields[4] as String?,
      personalPhoto: fields[5] as dynamic,
      userType: fields[6] as EngineeringOfficeCity?,
      governorate: fields[7] as EngineeringOfficeCity?,
      city: fields[8] as EngineeringOfficeCity?,
      engineer: fields[9] as dynamic,
      technicalWorker: fields[10] as dynamic,
      engineeringOffice: fields[11] as dynamic,
      enabled: fields[12] as bool?,
      business: fields[13] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, EngineeringOfficeUser obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.personalPhoto)
      ..writeByte(6)
      ..write(obj.userType)
      ..writeByte(7)
      ..write(obj.governorate)
      ..writeByte(8)
      ..write(obj.city)
      ..writeByte(9)
      ..write(obj.engineer)
      ..writeByte(10)
      ..write(obj.technicalWorker)
      ..writeByte(11)
      ..write(obj.engineeringOffice)
      ..writeByte(12)
      ..write(obj.enabled)
      ..writeByte(13)
      ..write(obj.business);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EngineeringOfficeUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EngineeringOfficeCityAdapter extends TypeAdapter<EngineeringOfficeCity> {
  @override
  final int typeId = 94;

  @override
  EngineeringOfficeCity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EngineeringOfficeCity(
      id: fields[0] as int?,
      code: fields[1] as String?,
      name: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, EngineeringOfficeCity obj) {
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
      other is EngineeringOfficeCityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EngineeringOfficeProfileResponseModel
    _$EngineeringOfficeProfileResponseModelFromJson(
            Map<String, dynamic> json) =>
        EngineeringOfficeProfileResponseModel(
          success: json['success'] as bool?,
          status: (json['status'] as num?)?.toInt(),
          data: json['data'] == null
              ? null
              : EngineeringOfficeData.fromJson(
                  json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$EngineeringOfficeProfileResponseModelToJson(
        EngineeringOfficeProfileResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

EngineeringOfficeData _$EngineeringOfficeDataFromJson(
        Map<String, dynamic> json) =>
    EngineeringOfficeData(
      id: (json['id'] as num?)?.toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : EngineeringOfficeUser.fromJson(
              json['user'] as Map<String, dynamic>),
      name: json['tradeName'] as String?,
      description: json['description'] as String?,
      commercialRegisterPath: json['commercialRegisterPath'] as String?,
      taxCardPath: json['taxCardPath'],
      personalCardPath: json['personalCardPath'],
      engineeringOfficeField: json['engineeringOfficeField'] == null
          ? null
          : EngineeringOffice.fromJson(
              json['engineeringOfficeField'] as Map<String, dynamic>),
      engineeringOfficeDepartments: (json['engineeringOfficeDepartments']
              as List<dynamic>?)
          ?.map((e) => EngineeringOffice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EngineeringOfficeDataToJson(
        EngineeringOfficeData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'user': instance.user,
      'tradeName': instance.name,
      'description': instance.description,
      'commercialRegisterPath': instance.commercialRegisterPath,
      'taxCardPath': instance.taxCardPath,
      'personalCardPath': instance.personalCardPath,
      'engineeringOfficeField': instance.engineeringOfficeField,
      'engineeringOfficeDepartments': instance.engineeringOfficeDepartments,
    };

EngineeringOffice _$EngineeringOfficeFromJson(Map<String, dynamic> json) =>
    EngineeringOffice(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      nameAr: json['nameAr'] as String?,
      nameEn: json['nameEn'] as String?,
    );

Map<String, dynamic> _$EngineeringOfficeToJson(EngineeringOffice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
    };

EngineeringOfficeUser _$EngineeringOfficeUserFromJson(
        Map<String, dynamic> json) =>
    EngineeringOfficeUser(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      personalPhoto: json['personalPhoto'],
      userType: json['userType'] == null
          ? null
          : EngineeringOfficeCity.fromJson(
              json['userType'] as Map<String, dynamic>),
      governorate: json['governorate'] == null
          ? null
          : EngineeringOfficeCity.fromJson(
              json['governorate'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : EngineeringOfficeCity.fromJson(
              json['city'] as Map<String, dynamic>),
      engineer: json['engineer'],
      technicalWorker: json['technicalWorker'],
      engineeringOffice: json['engineeringOffice'],
      enabled: json['enabled'] as bool?,
      business: json['business'],
    );

Map<String, dynamic> _$EngineeringOfficeUserToJson(
        EngineeringOfficeUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'personalPhoto': instance.personalPhoto,
      'userType': instance.userType,
      'governorate': instance.governorate,
      'city': instance.city,
      'engineer': instance.engineer,
      'technicalWorker': instance.technicalWorker,
      'engineeringOffice': instance.engineeringOffice,
      'enabled': instance.enabled,
      'business': instance.business,
    };

EngineeringOfficeCity _$EngineeringOfficeCityFromJson(
        Map<String, dynamic> json) =>
    EngineeringOfficeCity(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$EngineeringOfficeCityToJson(
        EngineeringOfficeCity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };
