import 'package:json_annotation/json_annotation.dart';

part 'city_model.g.dart';

@JsonSerializable()
class CityModel {
  @JsonKey(name: "data")
  final List<CityDataModel> data;

  CityModel({required this.data});

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}

@JsonSerializable()
class CityDataModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "code")
  final String code;
  @JsonKey(name: "name")
  final String name;

  CityDataModel({
    required this.id,
    required this.code,
    required this.name,
  });

  factory CityDataModel.fromJson(Map<String, dynamic> json) =>
      _$CityDataModelFromJson(json);
}
