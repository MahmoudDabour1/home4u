import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/auth/sign_up/data/models/services/engineer_type.dart';

part 'engineer_services.g.dart';

@JsonSerializable()
class EngineerServices {
  @JsonKey(name: "data")
  final List<EngineerServiceData> data;

  EngineerServices({
    required this.data,
  });

  factory EngineerServices.fromJson(Map<String, dynamic> json) =>
      _$EngineerServicesFromJson(json);
}

@JsonSerializable()
class EngineerServiceData {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "code")
  final String code;
  @JsonKey(name: "name")
  final String? name;


  EngineerServiceData({
    required this.id,
    required this.code,
    required this.name,
  });

  factory EngineerServiceData.fromJson(Map<String, dynamic> json) =>
      _$EngineerServiceDataFromJson(json);
}
