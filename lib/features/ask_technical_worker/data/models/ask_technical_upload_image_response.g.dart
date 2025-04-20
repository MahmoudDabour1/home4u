// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ask_technical_upload_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AskTechnicalUploadImageResponse _$AskTechnicalUploadImageResponseFromJson(
        Map<String, dynamic> json) =>
    AskTechnicalUploadImageResponse(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AskTechnicalUploadImageResponseToJson(
        AskTechnicalUploadImageResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      fileName: json['fileName'] as String?,
      fileDownloadUri: json['fileDownloadUri'] as String?,
      type: json['type'] as String?,
      size: (json['size'] as num?)?.toInt(),
      relatedTo: json['relatedTo'] as String?,
      relatedId: (json['relatedId'] as num?)?.toInt(),
      imagePath: json['imagePath'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'fileName': instance.fileName,
      'fileDownloadUri': instance.fileDownloadUri,
      'type': instance.type,
      'size': instance.size,
      'relatedTo': instance.relatedTo,
      'relatedId': instance.relatedId,
      'imagePath': instance.imagePath,
    };
