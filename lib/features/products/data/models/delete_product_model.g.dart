// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteProductModel _$DeleteProductModelFromJson(Map<String, dynamic> json) =>
    DeleteProductModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] as bool?,
    );

Map<String, dynamic> _$DeleteProductModelToJson(DeleteProductModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };
