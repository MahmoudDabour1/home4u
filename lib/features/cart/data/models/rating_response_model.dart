
import 'package:json_annotation/json_annotation.dart';

part 'rating_response_model.g.dart';
@JsonSerializable()
class RatingResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final Data? data;

  RatingResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory RatingResponseModel.fromJson(Map<String, dynamic> json) => _$RatingResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RatingResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "productId")
  final int? productId;
  @JsonKey(name: "rate")
  final double? rate;
  @JsonKey(name: "comment")
  final String? comment;

  Data({
    this.id,
    this.statusCode,
    this.productId,
    this.rate,
    this.comment,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
