import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/auth/sign_up/data/models/services/freelancer_types.dart';

part 'freelancer_services.g.dart';

@JsonSerializable()
class FreelancerServices {
  @JsonKey(name: "data")
  final List<FreelancerServiceData> data;

  FreelancerServices({
    required this.data,
  });

  factory FreelancerServices.fromJson(Map<String, dynamic> json) =>
      _$FreelancerServicesFromJson(json);
}

@JsonSerializable()
class FreelancerServiceData {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "code")
  final String code;
  @JsonKey(name: "name")
  final String? name;

  FreelancerServiceData({
    required this.id,
    required this.code,
    required this.name,
  });

  factory FreelancerServiceData.fromJson(Map<String, dynamic> json) =>
      _$FreelancerServiceDataFromJson(json);
}
