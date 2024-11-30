import 'package:json_annotation/json_annotation.dart';

part 'user_type_model.g.dart';

@JsonSerializable()
class UserTypeModel {
  @JsonKey(name: "data")
  final List<UserTypeData> data;

  UserTypeModel({
    required this.data,
  });

  factory UserTypeModel.fromJson(Map<String, dynamic> json) =>
      _$UserTypeModelFromJson(json);
}

@JsonSerializable()
class UserTypeData {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "code")
  final String code;
  @JsonKey(name: "name")
  final String name;

  UserTypeData({
    required this.id,
    required this.code,
    required this.name,
  });

  factory UserTypeData.fromJson(Map<String, dynamic> json) =>
      _$UserTypeDataFromJson(json);
}
