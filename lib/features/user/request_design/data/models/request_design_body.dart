import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_design_body.g.dart';

@JsonSerializable()
class RequestDesignBody {
  @JsonKey(name: "phoneNumber")
  final String? phoneNumber;
  @JsonKey(name: "unitType")
  final GovernorateRequest? unitType;
  @JsonKey(name: "governorate")
  final GovernorateRequest? governorate;
  @JsonKey(name: "unitArea")
  final int? unitArea;
  @JsonKey(name: "budget")
  final int? budget;
  @JsonKey(name: "requiredDuration")
  final int? requiredDuration;
  @JsonKey(name: "notes")
  final String? notes;

  RequestDesignBody({
    this.phoneNumber,
    this.unitType,
    this.governorate,
    this.unitArea,
    this.budget,
    this.requiredDuration,
    this.notes,
  });

  factory RequestDesignBody.fromJson(Map<String, dynamic> json) =>
      _$RequestDesignBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RequestDesignBodyToJson(this);
}

@JsonSerializable()
class GovernorateRequest {
  @JsonKey(name: "id")
  final int? id;

  GovernorateRequest({
    this.id,
  });
  factory GovernorateRequest.fromJson(Map<String, dynamic> json) =>
      _$GovernorateRequestFromJson(json);
  Map<String, dynamic> toJson() => _$GovernorateRequestToJson(this);
}
