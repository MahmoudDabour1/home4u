import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'engineer_profile_response_model.dart';

part 'technical_worker_profile_response_model.g.dart';

@HiveType(typeId: 75)
@JsonSerializable()
class TechnicalWorkerResponseModel {
  @HiveField(0)
  @JsonKey(name: "success")
  final bool? success;

  @HiveField(1)
  @JsonKey(name: "status")
  final int? status;

  @HiveField(2)
  @JsonKey(name: "data")
  final TechnicalData? data;

  TechnicalWorkerResponseModel({
    this.success,
    this.status,
    this.data,
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
  final int? id;

  @HiveField(1)
  @JsonKey(name: "statusCode")
  final int? statusCode;

  @HiveField(2)
  @JsonKey(name: "user")
  final FreeLancerUser? user;

  @HiveField(3)
  @JsonKey(name: "type")
  final FreeLancerType? type;

  @HiveField(4)
  @JsonKey(name: "yearsOfExperience")
  final int? yearsOfExperience;

  @HiveField(5)
  @JsonKey(name: "workerServs")
  List<FreeLancerType>? workerServs;

  @HiveField(6)
  @JsonKey(name: "bio")
  final String? bio;

  @HiveField(7)
  @JsonKey(name: "linkedinLink")
  String? linkedin;

  @HiveField(8)
  @JsonKey(name: "behanceLink")
  String? behance;
  @HiveField(9)
  @JsonKey(name: "facebookLink")
  String? facebookLink;

  TechnicalData({
    this.id,
    this.statusCode,
    this.user,
    this.type,
    this.yearsOfExperience,
    this.workerServs,
    this.bio,
    this.linkedin,
    this.behance,
    this.facebookLink,
  });

  factory TechnicalData.fromJson(Map<String, dynamic> json) =>
      _$TechnicalDataFromJson(json);

  Map<String, dynamic> toJson() => _$TechnicalDataToJson(this);
}
