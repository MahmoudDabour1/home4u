
import 'package:json_annotation/json_annotation.dart';
part 'top_engineers_response_model.g.dart';

@JsonSerializable()
class TopEngineersResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final List<Datum>? data;

  TopEngineersResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory TopEngineersResponseModel.fromJson(Map<String, dynamic> json) => _$TopEngineersResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TopEngineersResponseModelToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "createdDate")
  final DateTime? createdDate;
  @JsonKey(name: "modifiedDate")
  final DateTime? modifiedDate;
  @JsonKey(name: "user")
  final User? user;
  @JsonKey(name: "type")
  final Type? type;
  @JsonKey(name: "yearsOfExperience")
  final int? yearsOfExperience;
  @JsonKey(name: "engineerServ")
  final List<Type>? engineerServ;
  @JsonKey(name: "bio")
  final String? bio;
  @JsonKey(name: "facebookLink")
  final String? facebookLink;
  @JsonKey(name: "linkedinLink")
  final String? linkedinLink;
  @JsonKey(name: "behanceLink")
  final String? behanceLink;
  @JsonKey(name: "averageRate")
  final int? averageRate;

  Datum({
    this.id,
    this.statusCode,
    this.createdDate,
    this.modifiedDate,
    this.user,
    this.type,
    this.yearsOfExperience,
    this.engineerServ,
    this.bio,
    this.facebookLink,
    this.linkedinLink,
    this.behanceLink,
    this.averageRate,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class Type {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "nameAr")
  final String? nameAr;
  @JsonKey(name: "nameEn")
  final String? nameEn;

  Type({
    this.id,
    this.code,
    this.name,
    this.nameAr,
    this.nameEn,
  });

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "personalPhoto")
  final String? personalPhoto;
  @JsonKey(name: "coverPhoto")
  final dynamic coverPhoto;
  @JsonKey(name: "userType")
  final City? userType;
  @JsonKey(name: "governorate")
  final City? governorate;
  @JsonKey(name: "city")
  final City? city;
  @JsonKey(name: "engineer")
  final dynamic engineer;
  @JsonKey(name: "technicalWorker")
  final dynamic technicalWorker;
  @JsonKey(name: "engineeringOffice")
  final dynamic engineeringOffice;
  @JsonKey(name: "enabled")
  final bool? enabled;
  @JsonKey(name: "business")
  final dynamic business;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.personalPhoto,
    this.coverPhoto,
    this.userType,
    this.governorate,
    this.city,
    this.engineer,
    this.technicalWorker,
    this.engineeringOffice,
    this.enabled,
    this.business,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class City {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "name")
  final String? name;

  City({
    this.id,
    this.code,
    this.name,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
