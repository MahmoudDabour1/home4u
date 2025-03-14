// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductsResponseModelAdapter extends TypeAdapter<ProductsResponseModel> {
  @override
  final int typeId = 80;

  @override
  ProductsResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductsResponseModel(
      success: fields[0] as bool?,
      status: fields[1] as int?,
      data: fields[2] as Data?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductsResponseModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.success)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductsResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

  class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 81;

  @override
  Data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Data(
      content: (fields[0] as List?)?.cast<Content>(),
      pageable: fields[1] as Pageable?,
      totalPages: fields[2] as int?,
      totalElements: fields[3] as int?,
      last: fields[4] as bool?,
      size: fields[5] as int?,
      number: fields[6] as int?,
      sort: fields[7] as Sort?,
      numberOfElements: fields[8] as int?,
      first: fields[9] as bool?,
      empty: fields[10] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.content)
      ..writeByte(1)
      ..write(obj.pageable)
      ..writeByte(2)
      ..write(obj.totalPages)
      ..writeByte(3)
      ..write(obj.totalElements)
      ..writeByte(4)
      ..write(obj.last)
      ..writeByte(5)
      ..write(obj.size)
      ..writeByte(6)
      ..write(obj.number)
      ..writeByte(7)
      ..write(obj.sort)
      ..writeByte(8)
      ..write(obj.numberOfElements)
      ..writeByte(9)
      ..write(obj.first)
      ..writeByte(10)
      ..write(obj.empty);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ContentAdapter extends TypeAdapter<Content> {
  @override
  final int typeId = 82;

  @override
  Content read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Content(
      id: fields[0] as int?,
      name: fields[1] as String?,
      type: fields[2] as String?,
      price: fields[3] as double?,
      stockAmount: fields[4] as int?,
      length: fields[5] as int?,
      width: fields[6] as double?,
      height: fields[7] as int?,
      rate: fields[8] as int?,
      colors: (fields[9] as List?)?.cast<Color>(),
      imagePath: fields[10] as String?,
      inStock: fields[11] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Content obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.stockAmount)
      ..writeByte(5)
      ..write(obj.length)
      ..writeByte(6)
      ..write(obj.width)
      ..writeByte(7)
      ..write(obj.height)
      ..writeByte(8)
      ..write(obj.rate)
      ..writeByte(9)
      ..write(obj.colors)
      ..writeByte(10)
      ..write(obj.imagePath)
      ..writeByte(11)
      ..write(obj.inStock);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ColorAdapter extends TypeAdapter<Color> {
  @override
  final int typeId = 83;

  @override
  Color read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Color(
      id: fields[0] as int?,
      code: fields[1] as String?,
      name: fields[2] as String?,
      hexColor: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Color obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.hexColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PageableAdapter extends TypeAdapter<Pageable> {
  @override
  final int typeId = 84;

  @override
  Pageable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pageable(
      pageNumber: fields[0] as int?,
      pageSize: fields[1] as int?,
      sort: fields[2] as Sort?,
      offset: fields[3] as int?,
      paged: fields[4] as bool?,
      unPaged: fields[5] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Pageable obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.pageNumber)
      ..writeByte(1)
      ..write(obj.pageSize)
      ..writeByte(2)
      ..write(obj.sort)
      ..writeByte(3)
      ..write(obj.offset)
      ..writeByte(4)
      ..write(obj.paged)
      ..writeByte(5)
      ..write(obj.unPaged);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PageableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SortAdapter extends TypeAdapter<Sort> {
  @override
  final int typeId = 85;

  @override
  Sort read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sort(
      empty: fields[0] as bool?,
      sorted: fields[1] as bool?,
      unsorted: fields[2] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Sort obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.empty)
      ..writeByte(1)
      ..write(obj.sorted)
      ..writeByte(2)
      ..write(obj.unsorted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SortAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsResponseModel _$ProductsResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProductsResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductsResponseModelToJson(
        ProductsResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageable: json['pageable'] == null
          ? null
          : Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      totalElements: (json['totalElements'] as num?)?.toInt(),
      last: json['last'] as bool?,
      size: (json['size'] as num?)?.toInt(),
      number: (json['number'] as num?)?.toInt(),
      sort: json['sort'] == null
          ? null
          : Sort.fromJson(json['sort'] as Map<String, dynamic>),
      numberOfElements: (json['numberOfElements'] as num?)?.toInt(),
      first: json['first'] as bool?,
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'content': instance.content,
      'pageable': instance.pageable,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'last': instance.last,
      'size': instance.size,
      'number': instance.number,
      'sort': instance.sort,
      'numberOfElements': instance.numberOfElements,
      'first': instance.first,
      'empty': instance.empty,
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      type: json['type'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      stockAmount: (json['stockAmount'] as num?)?.toInt(),
      length: (json['length'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toInt(),
      rate: (json['rate'] as num?)?.toInt(),
      colors: (json['colors'] as List<dynamic>?)
          ?.map((e) => Color.fromJson(e as Map<String, dynamic>))
          .toList(),
      imagePath: json['imagePath'] as String?,
      inStock: json['inStock'] as bool?,
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'price': instance.price,
      'stockAmount': instance.stockAmount,
      'length': instance.length,
      'width': instance.width,
      'height': instance.height,
      'rate': instance.rate,
      'colors': instance.colors,
      'imagePath': instance.imagePath,
      'inStock': instance.inStock,
    };

Color _$ColorFromJson(Map<String, dynamic> json) => Color(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      hexColor: json['hexColor'] as String?,
    );

Map<String, dynamic> _$ColorToJson(Color instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'hexColor': instance.hexColor,
    };

Pageable _$PageableFromJson(Map<String, dynamic> json) => Pageable(
      pageNumber: (json['pageNumber'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      sort: json['sort'] == null
          ? null
          : Sort.fromJson(json['sort'] as Map<String, dynamic>),
      offset: (json['offset'] as num?)?.toInt(),
      paged: json['paged'] as bool?,
      unPaged: json['unpaged'] as bool?,
    );

Map<String, dynamic> _$PageableToJson(Pageable instance) => <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'sort': instance.sort,
      'offset': instance.offset,
      'paged': instance.paged,
      'unpaged': instance.unPaged,
    };

Sort _$SortFromJson(Map<String, dynamic> json) => Sort(
      empty: json['empty'] as bool?,
      sorted: json['sorted'] as bool?,
      unsorted: json['unsorted'] as bool?,
    );

Map<String, dynamic> _$SortToJson(Sort instance) => <String, dynamic>{
      'empty': instance.empty,
      'sorted': instance.sorted,
      'unsorted': instance.unsorted,
    };
