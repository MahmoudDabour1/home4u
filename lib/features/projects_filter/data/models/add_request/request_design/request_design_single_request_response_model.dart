import '../../ask_requests/renovate_house_custom_package_request/renovate_house_custom_package_request_response_model.dart';

class RequestDesignSingleRequestResponseModel {
  final bool success;
  final int status;
  final RenovateHouseCustomPackageRequestData data;

  RequestDesignSingleRequestResponseModel({
    required this.success,
    required this.status,
    required this.data,
  });

  factory RequestDesignSingleRequestResponseModel.fromJson(
      Map<String, dynamic> json) {
    return RequestDesignSingleRequestResponseModel(
      success: json['success'] as bool,
      status: json['status'] as int,
      data: RenovateHouseCustomPackageRequestData.fromJson(
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
