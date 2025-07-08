import 'package:home4u/features/projects_filter/data/models/ask_requests/ask_technical_request/ask_technical_request_response_model.dart';

class AskTechnicalSingleRequestResponseModel {
  final bool success;
  final int status;
  final AskTechnicalRequestData data;

  AskTechnicalSingleRequestResponseModel({
    required this.success,
    required this.status,
    required this.data,
  });

  factory AskTechnicalSingleRequestResponseModel.fromJson(
      Map<String, dynamic> json) {
    return AskTechnicalSingleRequestResponseModel(
      success: json['success'] as bool,
      status: json['status'] as int,
      data: AskTechnicalRequestData.fromJson(
          json['data'] as Map<String, dynamic>),
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
