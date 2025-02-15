import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'engineer_profile_response_model.dart';

part 'technical_worker_profile_response_model.g.dart';

@HiveType(typeId: 75)
@JsonSerializable()
class TechnicalWorkerResponseModel {
  @HiveField(0)
  @JsonKey(name: "success")
  final bool success;

  @HiveField(1)
  @JsonKey(name: "status")
  final int status;

  @HiveField(2)
  @JsonKey(name: "data")
  final TechnicalData data;

  TechnicalWorkerResponseModel({
    required this.success,
    required this.status,
    required this.data,
  });

  factory TechnicalWorkerResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TechnicalWorkerResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TechnicalWorkerResponseModelToJson(this);
}

@HiveType(typeId: 76)
@JsonSerializable()
class TechnicalData {
  @HiveField(0)
  @JsonKey(name: "id")
  final int id;

  @HiveField(1)
  @JsonKey(name: "statusCode")
  final int statusCode;

  @HiveField(2)
  @JsonKey(name: "user")
  final FreeLancerUser user;

  @HiveField(3)
  @JsonKey(name: "type")
  final FreeLancerType type;

  @HiveField(4)
  @JsonKey(name: "yearsOfExperience")
  final int yearsOfExperience;

  @HiveField(5)
  @JsonKey(name: "workerServs")
  final List<FreeLancerType> workerServs;

  @HiveField(6)
  @JsonKey(name: "bio")
  final String bio;

  TechnicalData({
    required this.id,
    required this.statusCode,
    required this.user,
    required this.type,
    required this.yearsOfExperience,
    required this.workerServs,
    required this.bio,
  });

  factory TechnicalData.fromJson(Map<String, dynamic> json) =>
      _$TechnicalDataFromJson(json);

  Map<String, dynamic> toJson() => _$TechnicalDataToJson(this);
}

