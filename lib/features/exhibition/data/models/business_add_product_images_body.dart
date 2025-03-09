import 'package:json_annotation/json_annotation.dart';

part 'business_add_product_images_body.g.dart';


@JsonSerializable()
class BusinessAddProductImagesBody {
  @JsonKey(name: "productId")
  final int productId;
  @JsonKey(name: "imagePath")
  final dynamic imagePath;

  BusinessAddProductImagesBody({
    required this.productId,
    required this.imagePath,
  });

  factory BusinessAddProductImagesBody.fromJson(Map<String, dynamic> json) =>
      _$BusinessAddProductImagesBodyFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessAddProductImagesBodyToJson(this);
}
