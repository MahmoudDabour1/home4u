import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_add_product_images_response.g.dart';

@JsonSerializable()
class BusinessAddProductImagesResponse {
  @JsonKey(name: "success")
  final bool success;
  @JsonKey(name: "status")
  final int status;
  @JsonKey(name: "data")
  final List<Datum> data;

  BusinessAddProductImagesResponse({
    required this.success,
    required this.status,
    required this.data,
  });

  factory BusinessAddProductImagesResponse.fromJson(Map<String, dynamic> json) => _$BusinessAddProductImagesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessAddProductImagesResponseToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "productId")
  final int productId;
  @JsonKey(name: "imagePath")
  final dynamic imagePath;

  Datum({
    required this.id,
    required this.productId,
    required this.imagePath,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
