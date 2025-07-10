// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_chart_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingChartResponseModel _$RatingChartResponseModelFromJson(
        Map<String, dynamic> json) =>
    RatingChartResponseModel(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RatingChartResponseModelToJson(
        RatingChartResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      overAllRating: (json['overAllRating'] as num?)?.toInt(),
      countRantings: (json['countRantings'] as num?)?.toInt(),
      oneStarPct: (json['oneStarPct'] as num?)?.toInt(),
      twoStarPct: (json['twoStarPct'] as num?)?.toInt(),
      threeStarPct: (json['threeStarPct'] as num?)?.toInt(),
      fourStarPct: (json['fourStarPct'] as num?)?.toInt(),
      fiveStarPct: (json['fiveStarPct'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'overAllRating': instance.overAllRating,
      'countRantings': instance.countRantings,
      'oneStarPct': instance.oneStarPct,
      'twoStarPct': instance.twoStarPct,
      'threeStarPct': instance.threeStarPct,
      'fourStarPct': instance.fourStarPct,
      'fiveStarPct': instance.fiveStarPct,
    };
