import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'engineer_type.g.dart';

@JsonSerializable()
@HiveType(typeId: 11)
class EngineerTypes {
  @JsonKey(name: "data")
  @HiveField(0)
  final List<EngineerTypeData> data;

  EngineerTypes({
    required this.data,
  });

  factory EngineerTypes.fromJson(Map<String, dynamic> json) =>
      _$EngineerTypesFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: 10)
class EngineerTypeData {
  @JsonKey(name: "id")
  @HiveField(0)
  final int id;
  @JsonKey(name: "code")
  @HiveField(1)
  final String code;
  @JsonKey(name: "name")
  @HiveField(2)
  final String name;


  EngineerTypeData({
    required this.id,
    required this.code,
    required this.name,
  });

  factory EngineerTypeData.fromJson(Map<String, dynamic> json) =>
      _$EngineerTypeDataFromJson(json);
}
