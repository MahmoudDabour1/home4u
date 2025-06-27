// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_rate_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductRateResponseModel _$ProductRateResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProductRateResponseModel(
      success: json['success'] as bool,
      status: (json['status'] as num).toInt(),
      data: json['data'] == null
          ? null
          : ProductRateData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductRateResponseModelToJson(
        ProductRateResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

ProductRateData _$ProductRateDataFromJson(Map<String, dynamic> json) =>
    ProductRateData(
      id: (json['id'] as num).toInt(),
      statusCode: (json['statusCode'] as num).toInt(),
      productId: (json['productId'] as num).toInt(),
      rate: (json['rate'] as num?)?.toDouble(),
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$ProductRateDataToJson(ProductRateData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'productId': instance.productId,
      'rate': instance.rate,
      'comment': instance.comment,
    };
