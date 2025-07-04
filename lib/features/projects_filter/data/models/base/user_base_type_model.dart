import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_base_type_model.g.dart';

@JsonSerializable()
class UserBaseTypeModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "code")
  final dynamic code;
  @JsonKey(name: "name")
  final dynamic name;
  @JsonKey(name: "nameAr")
  final dynamic nameAr;
  @JsonKey(name: "nameEn")
  final dynamic nameEn;

  UserBaseTypeModel({
    this.id,
    this.code,
    this.name,
    this.nameAr,
    this.nameEn,
  });

  factory UserBaseTypeModel.fromJson(Map<String, dynamic> json) =>
      _$UserBaseTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserBaseTypeModelToJson(this);
}
