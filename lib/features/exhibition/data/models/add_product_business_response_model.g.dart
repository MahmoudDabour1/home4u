// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_business_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductBusinessResponseModel _$AddProductBusinessResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddProductBusinessResponseModel(
      success: json['success'] as bool,
      status: (json['status'] as num).toInt(),
      data:
          BusinessAddProductData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddProductBusinessResponseModelToJson(
        AddProductBusinessResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

BusinessAddProductData _$BusinessAddProductDataFromJson(
        Map<String, dynamic> json) =>
    BusinessAddProductData(
      id: (json['id'] as num).toInt(),
      statusCode: (json['statusCode'] as num).toInt(),
      nameAr: json['nameAr'] as String,
      nameEn: json['nameEn'] as String,
      descriptionAr: json['descriptionAr'] as String,
      descriptionEn: json['descriptionEn'] as String,
      price: (json['price'] as num).toDouble(),
      length: (json['length'] as num).toInt(),
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      businessType: AddProductBaseUnit.fromJson(
          json['businessType'] as Map<String, dynamic>),
      baseUnit:
          AddProductBaseUnit.fromJson(json['baseUnit'] as Map<String, dynamic>),
      materials: (json['materials'] as List<dynamic>)
          .map((e) => AddProductBaseUnit.fromJson(e as Map<String, dynamic>))
          .toList(),
      stocks: (json['stocks'] as List<dynamic>)
          .map((e) => AddProductStock.fromJson(e as Map<String, dynamic>))
          .toList(),
      imagePaths: json['imagePaths'] as List<dynamic>,
    );

Map<String, dynamic> _$BusinessAddProductDataToJson(
        BusinessAddProductData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
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

AddProductBaseUnit _$AddProductBaseUnitFromJson(Map<String, dynamic> json) =>
    AddProductBaseUnit(
      id: (json['id'] as num).toInt(),
      code: json['code'],
      name: json['name'],
      hexColor: json['hexColor'],
    );

Map<String, dynamic> _$AddProductBaseUnitToJson(AddProductBaseUnit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'hexColor': instance.hexColor,
    };

AddProductStock _$AddProductStockFromJson(Map<String, dynamic> json) =>
    AddProductStock(
      id: (json['id'] as num).toInt(),
      statusCode: json['statusCode'],
      color: AddProductBaseUnit.fromJson(json['color'] as Map<String, dynamic>),
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$AddProductStockToJson(AddProductStock instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'color': instance.color,
      'amount': instance.amount,
    };
