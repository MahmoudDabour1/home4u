// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freelancer_services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FreelancerServices _$FreelancerServicesFromJson(Map<String, dynamic> json) =>
    FreelancerServices(
      success: json['success'] as bool,
      status: (json['status'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => ServiceData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FreelancerServicesToJson(FreelancerServices instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

ServiceData _$ServiceDataFromJson(Map<String, dynamic> json) => ServiceData(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String,
      nameAr: json['nameAr'] as String,
      nameEn: json['nameEn'] as String,
    );

Map<String, dynamic> _$ServiceDataToJson(ServiceData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
    };
