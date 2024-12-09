import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'freelancer_types.g.dart';

@JsonSerializable()
@HiveType(typeId: 11)
class FreelancerTypes {
  @JsonKey(name: "data")
  @HiveField(0)
  final List<FreelancerTypeData> data;

  FreelancerTypes({
    required this.data,
  });

  factory FreelancerTypes.fromJson(Map<String, dynamic> json) =>
      _$FreelancerTypesFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: 10)
class FreelancerTypeData {
  @JsonKey(name: "id")
  @HiveField(0)
  final int id;
  @JsonKey(name: "code")
  @HiveField(1)
  final String code;
  @JsonKey(name: "name")
  @HiveField(2)
  final String name;

  FreelancerTypeData({
    required this.id,
    required this.code,
    required this.name,
  });

  factory FreelancerTypeData.fromJson(Map<String, dynamic> json) =>
      _$FreelancerTypeDataFromJson(json);
}
