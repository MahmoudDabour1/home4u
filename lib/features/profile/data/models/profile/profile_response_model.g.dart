// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response_model.dart';

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
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileResponseModelToJson(
        ProfileResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      statusCode: json['statusCode'],
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      type: json['type'] == null
          ? null
          : Type.fromJson(json['type'] as Map<String, dynamic>),
      yearsOfExperience: (json['yearsOfExperience'] as num?)?.toInt(),
      engineerServ: (json['engineerServ'] as List<dynamic>?)
          ?.map((e) => Type.fromJson(e as Map<String, dynamic>))
          .toList(),
      bio: json['bio'] as String?,
      linkedin: json['linkedin'] as String?,
      behance: json['behance'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
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

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      nameAr: json['nameAr'] as String?,
      nameEn: json['nameEn'] as String?,
      engineerType: json['engineerType'] == null
          ? null
          : Type.fromJson(json['engineerType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
      'engineerType': instance.engineerType,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      personalPhoto: json['personalPhoto'],
      password: json['password'] as String?,
      userType: json['userType'] == null
          ? null
          : City.fromJson(json['userType'] as Map<String, dynamic>),
      governorate: json['governorate'] == null
          ? null
          : City.fromJson(json['governorate'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      engineer: json['engineer'],
      technicalWorker: json['technicalWorker'],
      enabled: json['enabled'] as bool?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
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

City _$CityFromJson(Map<String, dynamic> json) => City(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'],
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };
