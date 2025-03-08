// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_add_product_images_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessAddProductImagesBody _$BusinessAddProductImagesBodyFromJson(
        Map<String, dynamic> json) =>
    BusinessAddProductImagesBody(
      productId: (json['productId'] as num).toInt(),
      imagePath: json['imagePath'],
    );

Map<String, dynamic> _$BusinessAddProductImagesBodyToJson(
        BusinessAddProductImagesBody instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'imagePath': instance.imagePath,
    };
