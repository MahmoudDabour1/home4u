import 'package:freezed_annotation/freezed_annotation.dart';

part 'freelancer_services.g.dart';

@JsonSerializable()
class FreelancerServices {
  @JsonKey(name: "success")
  final bool success;
  @JsonKey(name: "status")
  final int status;
  @JsonKey(name: "data")
  final List<ServiceData> data;

  FreelancerServices({
    required this.success,
    required this.status,
    required this.data,
  });

  factory FreelancerServices.fromJson(Map<String, dynamic> json) => _$FreelancerServicesFromJson(json);

  Map<String, dynamic> toJson() => _$FreelancerServicesToJson(this);
}

@JsonSerializable()
class ServiceData {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "code")
  final String code;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "nameAr")
  final String nameAr;
  @JsonKey(name: "nameEn")
  final String nameEn;

  ServiceData({
    required this.id,
    required this.code,
    required this.name,
    required this.nameAr,
    required this.nameEn,
  });

  factory ServiceData.fromJson(Map<String, dynamic> json) => _$ServiceDataFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceDataToJson(this);
}
