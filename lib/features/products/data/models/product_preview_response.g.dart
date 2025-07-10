// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_preview_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductPreviewResponse _$ProductPreviewResponseFromJson(
        Map<String, dynamic> json) =>
    ProductPreviewResponse(
      success: json['success'] as bool,
      status: (json['status'] as num).toInt(),
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductPreviewResponseToJson(
        ProductPreviewResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num).toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      nameAr: json['nameAr'] as String,
      nameEn: json['nameEn'] as String,
      descriptionAr: json['descriptionAr'] as String,
      descriptionEn: json['descriptionEn'] as String,
      price: (json['price'] as num).toInt(),
      length: (json['length'] as num).toInt(),
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      businessType: ResponseBaseUnit.fromJson(
          json['businessType'] as Map<String, dynamic>),
      baseUnit:
          ResponseBaseUnit.fromJson(json['baseUnit'] as Map<String, dynamic>),
      materials: (json['materials'] as List<dynamic>)
          .map((e) => ResponseBaseUnit.fromJson(e as Map<String, dynamic>))
          .toList(),
      stocks: (json['stocks'] as List<dynamic>)
          .map((e) => ResponseStock.fromJson(e as Map<String, dynamic>))
          .toList(),
      imagePaths: (json['imagePaths'] as List<dynamic>)
          .map((e) => ImagePath.fromJson(e as Map<String, dynamic>))
          .toList(),
      businessTypeCategory: json['businessTypeCategory'] == null
          ? null
          : ResponseBaseUnit.fromJson(
              json['businessTypeCategory'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
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
      'businessTypeCategory': instance.businessTypeCategory,
      'baseUnit': instance.baseUnit,
      'materials': instance.materials,
      'stocks': instance.stocks,
      'imagePaths': instance.imagePaths,
    };

ResponseBaseUnit _$ResponseBaseUnitFromJson(Map<String, dynamic> json) =>
    ResponseBaseUnit(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String?,
      hexColor: json['hexColor'] as String?,
      businessType: json['businessType'] == null
          ? null
          : ResponseBaseUnit.fromJson(
              json['businessType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseBaseUnitToJson(ResponseBaseUnit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'hexColor': instance.hexColor,
      'businessType': instance.businessType,
    };

ImagePath _$ImagePathFromJson(Map<String, dynamic> json) => ImagePath(
      id: (json['id'] as num?)?.toInt(),
      productId: (json['productId'] as num?)?.toInt(),
      imagePath: json['imagePath'] as String,
    );

Map<String, dynamic> _$ImagePathToJson(ImagePath instance) => <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'imagePath': instance.imagePath,
    };

ResponseStock _$ResponseStockFromJson(Map<String, dynamic> json) =>
    ResponseStock(
      id: (json['id'] as num?)?.toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      color: ResponseBaseUnit.fromJson(json['color'] as Map<String, dynamic>),
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$ResponseStockToJson(ResponseStock instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusCode': instance.statusCode,
      'color': instance.color,
      'amount': instance.amount,
    };
