// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadImageResponse _$UploadImageResponseFromJson(Map<String, dynamic> json) =>
    UploadImageResponse(
      success: json['success'] as bool,
      status: (json['status'] as num).toInt(),
      data: UploadImageData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UploadImageResponseToJson(
        UploadImageResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

UploadImageData _$UploadImageDataFromJson(Map<String, dynamic> json) =>
    UploadImageData(
      fileName: json['fileName'] as String,
      fileDownloadUri: json['fileDownloadUri'] as String,
      type: json['type'] as String,
      size: (json['size'] as num).toInt(),
      relatedTo: json['relatedTo'] as String,
      relatedId: (json['relatedId'] as num).toInt(),
      imagePath: json['imagePath'] as String,
    );

Map<String, dynamic> _$UploadImageDataToJson(UploadImageData instance) =>
    <String, dynamic>{
      'fileName': instance.fileName,
      'fileDownloadUri': instance.fileDownloadUri,
      'type': instance.type,
      'size': instance.size,
      'relatedTo': instance.relatedTo,
      'relatedId': instance.relatedId,
      'imagePath': instance.imagePath,
    };
