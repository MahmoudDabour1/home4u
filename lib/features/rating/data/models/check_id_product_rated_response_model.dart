class CheckIdProductRatedResponseModel {
  final bool success;
  final int status;
  final bool data;

  CheckIdProductRatedResponseModel({
    required this.success,
    required this.status,
    required this.data,
  });

  factory CheckIdProductRatedResponseModel.fromJson(Map<String, dynamic> json) {
    return CheckIdProductRatedResponseModel(
      success: json['success'] as bool,
      status: json['status'] as int,
      data: json['data'] as bool,
    );
  }
}