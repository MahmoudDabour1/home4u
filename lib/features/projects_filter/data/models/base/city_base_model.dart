import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_base_model.g.dart';

@JsonSerializable()
class CityBaseModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "name")
  final String? name;

  CityBaseModel({
    this.id,
    this.code,
    this.name,
  });

  factory CityBaseModel.fromJson(Map<String, dynamic> json) => _$CityBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityBaseModelToJson(this);
}
