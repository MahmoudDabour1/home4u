import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/projects_filter/data/models/base/city_base_model.dart';
import 'package:home4u/features/projects_filter/data/models/base/user_base_model.dart';

part 'request_design_request_response_model.g.dart';

@JsonSerializable()
class RequestDesignRequestResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final List<RequestDesignRequestData>? data;

  RequestDesignRequestResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory RequestDesignRequestResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$RequestDesignRequestResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RequestDesignRequestResponseModelToJson(this);
}

@JsonSerializable()
class RequestDesignRequestData {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "createdDate")
  final DateTime? createdDate;
  @JsonKey(name: "modifiedDate")
  final DateTime? modifiedDate;
  @JsonKey(name: "user")
  final UserBaseModel? user;
  @JsonKey(name: "requestDesign")
  final RequestDesign? requestDesign;
  @JsonKey(name: "comment")
  final String? comment;
  @JsonKey(name: "isAccepted")
  final dynamic isAccepted;
  @JsonKey(name: "isFinished")
  final dynamic isFinished;
  @JsonKey(name: "isRejected")
  final dynamic isRejected;

  RequestDesignRequestData({
    this.id,
    this.statusCode,
    this.createdDate,
    this.modifiedDate,
    this.user,
    this.requestDesign,
    this.comment,
    this.isAccepted,
    this.isFinished,
    this.isRejected,
  });

  factory RequestDesignRequestData.fromJson(Map<String, dynamic> json) =>
      _$RequestDesignRequestDataFromJson(json);

  Map<String, dynamic> toJson() => _$RequestDesignRequestDataToJson(this);
}

@JsonSerializable()
class RequestDesign {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "createdDate")
  final DateTime? createdDate;
  @JsonKey(name: "modifiedDate")
  final DateTime? modifiedDate;
  @JsonKey(name: "user")
  final UserBaseModel? user;
  @JsonKey(name: "phoneNumber")
  final String? phoneNumber;
  @JsonKey(name: "unitType")
  final CityBaseModel? unitType;
  @JsonKey(name: "governorate")
  final CityBaseModel? governorate;
  @JsonKey(name: "unitArea")
  final int? unitArea;
  @JsonKey(name: "budget")
  final int? budget;
  @JsonKey(name: "requiredDuration")
  final int? requiredDuration;
  @JsonKey(name: "notes")
  final String? notes;
  @JsonKey(name: "requestCount")
  final int? requestCount;
  @JsonKey(name: "askStatus")
  final String? askStatus;

  RequestDesign({
    this.id,
    this.statusCode,
    this.createdDate,
    this.modifiedDate,
    this.user,
    this.phoneNumber,
    this.unitType,
    this.governorate,
    this.unitArea,
    this.budget,
    this.requiredDuration,
    this.notes,
    this.requestCount,
    this.askStatus,
  });

  factory RequestDesign.fromJson(Map<String, dynamic> json) =>
      _$RequestDesignFromJson(json);

  Map<String, dynamic> toJson() => _$RequestDesignToJson(this);
}


@JsonSerializable()
class Authority {
  @JsonKey(name: "authority")
  final String? authority;

  Authority({
    this.authority,
  });

  factory Authority.fromJson(Map<String, dynamic> json) =>
      _$AuthorityFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorityToJson(this);
}
