import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_type.g.dart';

@JsonSerializable()
class BusinessTypesModel {
  @JsonKey(name: "success")
  final bool success;
  @JsonKey(name: "status")
  final int status;
  @JsonKey(name: "data")
  final List<BaseData> data;

  BusinessTypesModel({
    required this.success,
    required this.status,
    required this.data,
  });

  factory BusinessTypesModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessTypesModelFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessTypesModelToJson(this);
}

@JsonSerializable()
class BaseData {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "code")
  final String code;
  @JsonKey(name: "name")
  final String name;

  BaseData({
    required this.id,
    required this.code,
    required this.name,
  });

  factory BaseData.fromJson(Map<String, dynamic> json) =>
      _$BaseDataFromJson(json);

  Map<String, dynamic> toJson() => _$BaseDataToJson(this);
}
