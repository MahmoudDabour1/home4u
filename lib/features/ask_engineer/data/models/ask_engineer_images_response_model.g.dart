// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ask_engineer_images_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AskEngineerImagesResponseModel _$AskEngineerImagesResponseModelFromJson(
        Map<String, dynamic> json) =>
    AskEngineerImagesResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AskEngineerImagesResponseModelToJson(
        AskEngineerImagesResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: (json['id'] as num?)?.toInt(),
      askEngineerId: (json['askEngineerId'] as num?)?.toInt(),
      photoPath: json['photoPath'],
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'askEngineerId': instance.askEngineerId,
      'photoPath': instance.photoPath,
    };
