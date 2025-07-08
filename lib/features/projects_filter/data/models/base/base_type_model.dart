import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_type_model.g.dart';

@JsonSerializable()
class BaseTypeModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "nameAr")
  final String? nameAr;
  @JsonKey(name: "nameEn")
  final String? nameEn;

  BaseTypeModel({
    this.id,
    this.code,
    this.name,
    this.nameAr,
    this.nameEn,
  });

  factory BaseTypeModel.fromJson(Map<String, dynamic> json) =>
      _$BaseTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseTypeModelToJson(this);
}
