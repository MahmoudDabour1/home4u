import 'package:json_annotation/json_annotation.dart';
part 'rating_chart_response_model.g.dart';
@JsonSerializable()
class RatingChartResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final Data? data;

  RatingChartResponseModel({
    this.success,
    this.status,
    this.data,
  });

  factory RatingChartResponseModel.fromJson(Map<String, dynamic> json) => _$RatingChartResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RatingChartResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "overAllRating")
  final int? overAllRating;
  @JsonKey(name: "countRantings")
  final int? countRantings;
  @JsonKey(name: "oneStarPct")
  final int? oneStarPct;
  @JsonKey(name: "twoStarPct")
  final int? twoStarPct;
  @JsonKey(name: "threeStarPct")
  final int? threeStarPct;
  @JsonKey(name: "fourStarPct")
  final int? fourStarPct;
  @JsonKey(name: "fiveStarPct")
  final int? fiveStarPct;

  Data({
    this.overAllRating,
    this.countRantings,
    this.oneStarPct,
    this.twoStarPct,
    this.threeStarPct,
    this.fourStarPct,
    this.fiveStarPct,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
