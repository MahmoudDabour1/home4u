// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_update_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductUpdateBody _$ProductUpdateBodyFromJson(Map<String, dynamic> json) =>
    ProductUpdateBody(
      id: (json['id'] as num).toInt(),
      nameAr: json['nameAr'] as String,
      nameEn: json['nameEn'] as String,
      descriptionAr: json['descriptionAr'] as String,
      descriptionEn: json['descriptionEn'] as String,
      price: (json['price'] as num).toDouble(),
      length: (json['length'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      businessType:
          UpdateBaseUnit.fromJson(json['businessType'] as Map<String, dynamic>),
      baseUnit:
          UpdateBaseUnit.fromJson(json['baseUnit'] as Map<String, dynamic>),
      materials: (json['materials'] as List<dynamic>)
          .map((e) => UpdateBaseUnit.fromJson(e as Map<String, dynamic>))
          .toList(),
      stocks: (json['stocks'] as List<dynamic>)
          .map((e) => UpdateStock.fromJson(e as Map<String, dynamic>))
          .toList(),
      imagePaths: json['imagePaths'] as List<dynamic>,
    );

Map<String, dynamic> _$ProductUpdateBodyToJson(ProductUpdateBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
      'descriptionAr': instance.descriptionAr,
      'descriptionEn': instance.descriptionEn,
      'price': instance.price,
      'length': instance.length,
      'width': instance.width,
      'height': instance.height,
      'businessType': instance.businessType,
      'baseUnit': instance.baseUnit,
      'materials': instance.materials,
      'stocks': instance.stocks,
      'imagePaths': instance.imagePaths,
    };

UpdateBaseUnit _$UpdateBaseUnitFromJson(Map<String, dynamic> json) =>
    UpdateBaseUnit(
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$UpdateBaseUnitToJson(UpdateBaseUnit instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

UpdateStock _$UpdateStockFromJson(Map<String, dynamic> json) => UpdateStock(
      color: UpdateBaseUnit.fromJson(json['color'] as Map<String, dynamic>),
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$UpdateStockToJson(UpdateStock instance) =>
    <String, dynamic>{
      'color': instance.color,
      'amount': instance.amount,
    };
