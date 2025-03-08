// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_add_product_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessAddProductBody _$BusinessAddProductBodyFromJson(
        Map<String, dynamic> json) =>
    BusinessAddProductBody(
      nameAr: json['nameAr'] as String,
      nameEn: json['nameEn'] as String,
      descriptionAr: json['descriptionAr'] as String,
      descriptionEn: json['descriptionEn'] as String,
      businessType:
          BaseUnit.fromJson(json['businessType'] as Map<String, dynamic>),
      price: (json['price'] as num).toDouble(),
      length: (json['length'] as num).toInt(),
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toInt(),
      baseUnit: BaseUnit.fromJson(json['baseUnit'] as Map<String, dynamic>),
      materials: (json['materials'] as List<dynamic>)
          .map((e) => BaseUnit.fromJson(e as Map<String, dynamic>))
          .toList(),
      stocks: (json['stocks'] as List<dynamic>)
          .map((e) => Stock.fromJson(e as Map<String, dynamic>))
          .toList(),
      imagePaths: json['imagePaths'] as List<dynamic>,
    );

Map<String, dynamic> _$BusinessAddProductBodyToJson(
        BusinessAddProductBody instance) =>
    <String, dynamic>{
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
      'descriptionAr': instance.descriptionAr,
      'descriptionEn': instance.descriptionEn,
      'businessType': instance.businessType,
      'price': instance.price,
      'length': instance.length,
      'width': instance.width,
      'height': instance.height,
      'baseUnit': instance.baseUnit,
      'materials': instance.materials,
      'stocks': instance.stocks,
      'imagePaths': instance.imagePaths,
    };

BaseUnit _$BaseUnitFromJson(Map<String, dynamic> json) => BaseUnit(
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$BaseUnitToJson(BaseUnit instance) => <String, dynamic>{
      'id': instance.id,
    };

Stock _$StockFromJson(Map<String, dynamic> json) => Stock(
      amount: (json['amount'] as num).toInt(),
      color: BaseUnit.fromJson(json['color'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StockToJson(Stock instance) => <String, dynamic>{
      'amount': instance.amount,
      'color': instance.color,
    };
