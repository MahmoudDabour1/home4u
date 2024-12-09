// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freelancer_services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FreelancerServices _$FreelancerServicesFromJson(Map<String, dynamic> json) =>
    FreelancerServices(
      data: (json['data'] as List<dynamic>)
          .map((e) => FreelancerServiceData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FreelancerServicesToJson(FreelancerServices instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

FreelancerServiceData _$FreelancerServiceDataFromJson(
        Map<String, dynamic> json) =>
    FreelancerServiceData(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$FreelancerServiceDataToJson(
        FreelancerServiceData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };
