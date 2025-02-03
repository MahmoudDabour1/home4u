// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileResponseModelAdapter extends TypeAdapter<ProfileResponseModel> {
  @override
  final int typeId = 70;

  @override
  ProfileResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileResponseModel(
      success: fields[0] as bool?,
      status: fields[1] as int?,
      data: fields[2] as FreeLancerData?,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileResponseModel obj) {
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
      other is ProfileResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FreeLancerDataAdapter extends TypeAdapter<FreeLancerData> {
  @override
  final int typeId = 71;

  @override
  FreeLancerData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FreeLancerData(
      id: fields[0] as int?,
      statusCode: fields[1] as dynamic,
      user: fields[2] as FreeLancerUser?,
      type: fields[3] as FreeLancerType?,
      yearsOfExperience: fields[4] as int?,
      engineerServ: (fields[5] as List?)?.cast<FreeLancerType>(),
      bio: fields[6] as String?,
      linkedin: fields[7] as String?,
      behance: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FreeLancerData obj) {
    writer
      ..writeByte(9)
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
      ..write(obj.engineerServ)
      ..writeByte(6)
      ..write(obj.bio)
      ..writeByte(7)
      ..write(obj.linkedin)
      ..writeByte(8)
      ..write(obj.behance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FreeLancerDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FreeLancerTypeAdapter extends TypeAdapter<FreeLancerType> {
  @override
  final int typeId = 72;

  @override
  FreeLancerType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FreeLancerType(
      id: fields[0] as int?,
      code: fields[1] as String?,
      name: fields[2] as String?,
      nameAr: fields[3] as String?,
      nameEn: fields[4] as String?,
      engineerType: fields[5] as FreeLancerType?,
    );
  }

  @override
  void write(BinaryWriter writer, FreeLancerType obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.nameAr)
      ..writeByte(4)
      ..write(obj.nameEn)
      ..writeByte(5)
      ..write(obj.engineerType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FreeLancerTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FreeLancerUserAdapter extends TypeAdapter<FreeLancerUser> {
  @override
  final int typeId = 73;

  @override
  FreeLancerUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FreeLancerUser(
      id: fields[0] as int?,
      firstName: fields[1] as String?,
      lastName: fields[2] as String?,
      email: fields[3] as String?,
      phone: fields[4] as String?,
      personalPhoto: fields[5] as dynamic,
      password: fields[6] as String?,
      userType: fields[7] as FreeLancerCity?,
      governorate: fields[8] as FreeLancerCity?,
      city: fields[9] as FreeLancerCity?,
      engineer: fields[10] as dynamic,
      technicalWorker: fields[11] as dynamic,
      enabled: fields[12] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, FreeLancerUser obj) {
    writer
      ..writeByte(13)
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
      ..write(obj.password)
      ..writeByte(7)
      ..write(obj.userType)
      ..writeByte(8)
      ..write(obj.governorate)
      ..writeByte(9)
      ..write(obj.city)
      ..writeByte(10)
      ..write(obj.engineer)
      ..writeByte(11)
      ..write(obj.technicalWorker)
      ..writeByte(12)
      ..write(obj.enabled);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FreeLancerUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FreeLancerCityAdapter extends TypeAdapter<FreeLancerCity> {
  @override
  final int typeId = 74;

  @override
  FreeLancerCity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FreeLancerCity(
      id: fields[0] as int?,
      code: fields[1] as String?,
      name: fields[2] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, FreeLancerCity obj) {
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
      other is FreeLancerCityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponseModel _$ProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProfileResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : FreeLancerData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileResponseModelToJson(
        ProfileResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

FreeLancerData _$FreeLancerDataFromJson(Map<String, dynamic> json) =>
    FreeLancerData(
      id: (json['id'] as num?)?.toInt(),
      statusCode: json['statusCode'],
      user: json['user'] == null
          ? null
          : FreeLancerUser.fromJson(json['user'] as Map<String, dynamic>),
      type: json['type'] == null
          ? null
          : FreeLancerType.fromJson(json['type'] as Map<String, dynamic>),
      yearsOfExperience: (json['yearsOfExperience'] as num?)?.toInt(),
      engineerServ: (json['engineerServ'] as List<dynamic>?)
          ?.map((e) => FreeLancerType.fromJson(e as Map<String, dynamic>))
          .toList(),
      bio: json['bio'] as String?,
      linkedin: json['linkedin'] as String?,
      behance: json['behance'] as String?,
    );

Map<String, dynamic> _$FreeLancerDataToJson(FreeLancerData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'user': instance.user,
      'type': instance.type,
      'yearsOfExperience': instance.yearsOfExperience,
      'engineerServ': instance.engineerServ,
      'bio': instance.bio,
      'linkedin': instance.linkedin,
      'behance': instance.behance,
    };

FreeLancerType _$FreeLancerTypeFromJson(Map<String, dynamic> json) =>
    FreeLancerType(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      nameAr: json['nameAr'] as String?,
      nameEn: json['nameEn'] as String?,
      engineerType: json['engineerType'] == null
          ? null
          : FreeLancerType.fromJson(
              json['engineerType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FreeLancerTypeToJson(FreeLancerType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
      'engineerType': instance.engineerType,
    };

FreeLancerUser _$FreeLancerUserFromJson(Map<String, dynamic> json) =>
    FreeLancerUser(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      personalPhoto: json['personalPhoto'],
      password: json['password'] as String?,
      userType: json['userType'] == null
          ? null
          : FreeLancerCity.fromJson(json['userType'] as Map<String, dynamic>),
      governorate: json['governorate'] == null
          ? null
          : FreeLancerCity.fromJson(
              json['governorate'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : FreeLancerCity.fromJson(json['city'] as Map<String, dynamic>),
      engineer: json['engineer'],
      technicalWorker: json['technicalWorker'],
      enabled: json['enabled'] as bool?,
    );

Map<String, dynamic> _$FreeLancerUserToJson(FreeLancerUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'personalPhoto': instance.personalPhoto,
      'password': instance.password,
      'userType': instance.userType,
      'governorate': instance.governorate,
      'city': instance.city,
      'engineer': instance.engineer,
      'technicalWorker': instance.technicalWorker,
      'enabled': instance.enabled,
    };

FreeLancerCity _$FreeLancerCityFromJson(Map<String, dynamic> json) =>
    FreeLancerCity(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'],
    );

Map<String, dynamic> _$FreeLancerCityToJson(FreeLancerCity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };
