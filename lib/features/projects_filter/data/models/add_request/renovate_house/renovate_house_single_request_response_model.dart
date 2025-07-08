import 'package:home4u/features/projects_filter/data/models/ask_requests/renovate_house_request/renovate_house_request_response_model.dart';

class RenovateHouseSingleRequestResponseModel {
  final bool success;
  final int status;
  final RenovateHouseRequestData data;

  RenovateHouseSingleRequestResponseModel({
    required this.success,
    required this.status,
    required this.data,
  });

  factory RenovateHouseSingleRequestResponseModel.fromJson(
      Map<String, dynamic> json) {
    return RenovateHouseSingleRequestResponseModel(
      success: json['success'] as bool,
      status: json['status'] as int,
      data: RenovateHouseRequestData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'status': status,
      'data': data.toJson(),
    };
  }
}