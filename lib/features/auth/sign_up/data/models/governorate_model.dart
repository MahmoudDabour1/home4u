import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'governorate_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class GovernorateModel {
  @JsonKey(name: "data")@HiveField(0)
  final List<GovernorateDataModel> data;

  GovernorateModel({required this.data});

  factory GovernorateModel.fromJson(Map<String, dynamic> json) =>
      _$GovernorateModelFromJson(json);
}


@JsonSerializable()
@HiveType(typeId: 0)
class GovernorateDataModel {
  @JsonKey(name: "id")
  @HiveField(0)
  final int id;
  @JsonKey(name: "code")
  @HiveField(1)
  final String code;
  @JsonKey(name: "name")
  @HiveField(2)
  final String name;

  GovernorateDataModel({
    required this.id,
    required this.code,
    required this.name,
  });

  factory GovernorateDataModel.fromJson(Map<String, dynamic> json) =>
      _$GovernorateDataModelFromJson(json);
}
