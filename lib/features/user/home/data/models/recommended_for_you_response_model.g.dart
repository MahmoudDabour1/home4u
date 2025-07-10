// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommended_for_you_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendedForYouResponseModel _$RecommendedForYouResponseModelFromJson(
        Map<String, dynamic> json) =>
    RecommendedForYouResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecommendedForYouResponseModelToJson(
        RecommendedForYouResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
      countRates: (json['countRates'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
      numberOfSales: (json['numberOfSales'] as num?)?.toInt(),
      bestSeller: json['bestSeller'] as bool?,
      productRankBySales: (json['productRankBySales'] as num?)?.toInt(),
      categoryName: json['categoryName'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rate': instance.rate,
      'countRates': instance.countRates,
      'price': instance.price,
      'numberOfSales': instance.numberOfSales,
      'bestSeller': instance.bestSeller,
      'productRankBySales': instance.productRankBySales,
      'categoryName': instance.categoryName,
      'images': instance.images,
    };
