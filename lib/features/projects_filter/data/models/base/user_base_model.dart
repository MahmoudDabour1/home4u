import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/projects_filter/data/models/base/user_base_type_model.dart';

import '../../../../ask_engineer/data/models/ask_engineer_response_model.dart';

part 'user_base_model.g.dart';

@JsonSerializable()
class UserBaseModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "createdDate")
  final DateTime? createdDate;
  @JsonKey(name: "modifiedDate")
  final DateTime? modifiedDate;
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "userType")
  final UserBaseTypeModel? userType;
  @JsonKey(name: "governorate")
  final City? governorate;
  @JsonKey(name: "city")
  final City? city;
  @JsonKey(name: "business")
  final String? business;
  @JsonKey(name: "personalPhoto")
  final String? personalPhoto;

  UserBaseModel({
    this.id,
    this.statusCode,
    this.createdDate,
    this.modifiedDate,
    this.username,
    this.email,
    this.phone,
    this.userType,
    this.governorate,
    this.city,
    this.business,
    this.personalPhoto,
  });

  factory UserBaseModel.fromJson(Map<String, dynamic> json) =>
      _$UserBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserBaseModelToJson(this);
}
