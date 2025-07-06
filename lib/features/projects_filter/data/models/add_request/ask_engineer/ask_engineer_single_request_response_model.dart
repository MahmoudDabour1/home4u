import '../../ask_requests/ask_engineer_request/ask_engineer_request_response_model.dart';

class AskEngineerSingleRequestResponseModel {
  final bool success;
  final int status;
  final AskEngineerRequestData data;

  AskEngineerSingleRequestResponseModel({
    required this.success,
    required this.status,
    required this.data,
  });

  factory AskEngineerSingleRequestResponseModel.fromJson(
      Map<String, dynamic> json) {
    return AskEngineerSingleRequestResponseModel(
      success: json['success'] as bool,
      status: json['status'] as int,
      data:
          AskEngineerRequestData.fromJson(json['data'] as Map<String, dynamic>),
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
