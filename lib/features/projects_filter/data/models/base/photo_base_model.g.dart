// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoBaseModel _$PhotoBaseModelFromJson(Map<String, dynamic> json) =>
    PhotoBaseModel(
      id: (json['id'] as num?)?.toInt(),
      askWorkerId: (json['askWorkerId'] as num?)?.toInt(),
      photoPath: json['photoPath'] as String?,
    );

Map<String, dynamic> _$PhotoBaseModelToJson(PhotoBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'askWorkerId': instance.askWorkerId,
      'photoPath': instance.photoPath,
    };
