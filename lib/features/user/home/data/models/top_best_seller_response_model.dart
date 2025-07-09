import 'package:json_annotation/json_annotation.dart';
part  'top_best_seller_response_model.g.dart';
@JsonSerializable()
class TopBestSellerResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final List<Datum>? data;

  TopBestSellerResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory TopBestSellerResponseModel.fromJson(Map<String, dynamic> json) => _$TopBestSellerResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TopBestSellerResponseModelToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "rate")
  final double? rate;
  @JsonKey(name: "countRates")
  final int? countRates;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "numberOfSales")
  final int? numberOfSales;
  @JsonKey(name: "bestSeller")
  final bool? bestSeller;
  @JsonKey(name: "productRankBySales")
  final int? productRankBySales;
  @JsonKey(name: "categoryName")
  final String? categoryName;
  @JsonKey(name: "images")
  final List<String>? images;

  Datum({
    this.id,
    this.name,
    this.rate,
    this.countRates,
    this.price,
    this.numberOfSales,
    this.bestSeller,
    this.productRankBySales,
    this.categoryName,
    this.images,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
