// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ask_engineer_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AskEngineerResponseModel _$AskEngineerResponseModelFromJson(
        Map<String, dynamic> json) =>
    AskEngineerResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AskEngineerResponseModelToJson(
        AskEngineerResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      phoneNumber: json['phoneNumber'] as String?,
      projectName: json['projectName'] as String?,
      projectDescription: json['projectDescription'] as String?,
      engineerType: json['engineerType'] == null
          ? null
          : EngineerType.fromJson(json['engineerType'] as Map<String, dynamic>),
      unitType: json['unitType'] == null
          ? null
          : EngineerType.fromJson(json['unitType'] as Map<String, dynamic>),
      budget: (json['budget'] as num?)?.toInt(),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      governorate: json['governorate'] == null
          ? null
          : City.fromJson(json['governorate'] as Map<String, dynamic>),
      urgencyLevel: json['urgencyLevel'] == null
          ? null
          : EngineerType.fromJson(json['urgencyLevel'] as Map<String, dynamic>),
      deadline: json['deadline'] as String?,
      photos: json['photos'],
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'phoneNumber': instance.phoneNumber,
      'projectName': instance.projectName,
      'projectDescription': instance.projectDescription,
      'engineerType': instance.engineerType,
      'unitType': instance.unitType,
      'budget': instance.budget,
      'city': instance.city,
      'governorate': instance.governorate,
      'urgencyLevel': instance.urgencyLevel,
      'deadline': instance.deadline,
      'photos': instance.photos,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'],
      name: json['name'],
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };

EngineerType _$EngineerTypeFromJson(Map<String, dynamic> json) => EngineerType(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'],
      name: json['name'],
      nameAr: json['nameAr'],
      nameEn: json['nameEn'],
    );

Map<String, dynamic> _$EngineerTypeToJson(EngineerType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
    };
