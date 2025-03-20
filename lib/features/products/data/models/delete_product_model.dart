import 'package:json_annotation/json_annotation.dart';

part 'delete_product_model.g.dart';

@JsonSerializable()
class DeleteProductModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final bool? data;

  DeleteProductModel({
    this.success,
    this.status,
    this.data,
  });

  factory DeleteProductModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteProductModelToJson(this);
}
