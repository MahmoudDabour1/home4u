import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/auth/sign_up/data/models/worker_body.dart';

import 'business_body.dart';
import 'engineer_body.dart';
import 'engineering_office_body.dart';

part 'sign_up_body.g.dart';

@JsonSerializable()
class SignUpBody {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  final UserTypeRequest userType;
  final GovernorateRequest? governorate;
  final CityRequest? city;
  final EngineerRequest? engineer;
  final TechnicalWorkerRequest? technicalWorker;
  final BusinessBody? business;
  @JsonKey(name: "engineeringOffice")
  final EngineeringOfficeRequest? engineeringOffice;

  SignUpBody({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.userType,
    this.governorate,
    this.city,
    this.engineer,
    this.technicalWorker,
    this.business,
    this.engineeringOffice,
  });

  factory SignUpBody.fromJson(Map<String, dynamic> json) =>
      _$SignUpBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpBodyToJson(this);
}

@JsonSerializable()
class UserTypeRequest {
  final int id;
  final String code;

  UserTypeRequest({
    required this.id,
    required this.code,
  });

  factory UserTypeRequest.fromJson(Map<String, dynamic> json) =>
      _$UserTypeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserTypeRequestToJson(this);
}

@JsonSerializable()
class GovernorateRequest {
  final int id;

  GovernorateRequest({
    required this.id,
  });

  factory GovernorateRequest.fromJson(Map<String, dynamic> json) =>
      _$GovernorateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GovernorateRequestToJson(this);
}

@JsonSerializable()
class CityRequest {
  final int id;

  CityRequest({
    required this.id,
  });

  factory CityRequest.fromJson(Map<String, dynamic> json) =>
      _$CityRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CityRequestToJson(this);
}
