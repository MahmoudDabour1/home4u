// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_add_product_images_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessAddProductImagesResponse _$BusinessAddProductImagesResponseFromJson(
        Map<String, dynamic> json) =>
    BusinessAddProductImagesResponse(
      success: json['success'] as bool,
      status: (json['status'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BusinessAddProductImagesResponseToJson(
        BusinessAddProductImagesResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: (json['id'] as num).toInt(),
      productId: (json['productId'] as num).toInt(),
      imagePath: json['imagePath'],
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'imagePath': instance.imagePath,
    };
