// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ask_technical_images_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AskTechnicalImageResponseModel _$AskTechnicalImageResponseModelFromJson(
        Map<String, dynamic> json) =>
    AskTechnicalImageResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AskTechnicalImageResponseModelToJson(
        AskTechnicalImageResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: (json['id'] as num?)?.toInt(),
      askWorkerId: (json['askWorkerId'] as num?)?.toInt(),
      photoPath: json['photoPath'],
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'askWorkerId': instance.askWorkerId,
      'photoPath': instance.photoPath,
    };
