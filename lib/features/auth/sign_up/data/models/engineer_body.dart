import 'package:freezed_annotation/freezed_annotation.dart';

part 'engineer_body.g.dart';

@JsonSerializable()
class EngineerRequest {
  final EngineerTypeRequest type;
  final int yearsOfExperience;
  final List<EngineerServiceRequest> engineerServ;

  EngineerRequest({
    required this.type,
    required this.yearsOfExperience,
    required this.engineerServ,
  });

  factory EngineerRequest.fromJson(Map<String, dynamic> json) => _$EngineerRequestFromJson(json);
  Map<String, dynamic> toJson() => _$EngineerRequestToJson(this);
}

@JsonSerializable()
class EngineerTypeRequest {
  final int id;

  EngineerTypeRequest({
    required this.id,
  });

  factory EngineerTypeRequest.fromJson(Map<String, dynamic> json) => _$EngineerTypeRequestFromJson(json);
  Map<String, dynamic> toJson() => _$EngineerTypeRequestToJson(this);
}

@JsonSerializable()
class EngineerServiceRequest {
  final int id;

  EngineerServiceRequest({
    required this.id,
  });

  factory EngineerServiceRequest.fromJson(Map<String, dynamic> json) => _$EngineerServiceRequestFromJson(json);
  Map<String, dynamic> toJson() => _$EngineerServiceRequestToJson(this);
}