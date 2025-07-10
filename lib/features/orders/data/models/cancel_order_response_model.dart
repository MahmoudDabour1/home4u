// {
// "success": true,
// "status": 200,
// "data": "The order has been canceled successfully"
// }

class CancelOrderResponseModel {
  final bool? success;
  final int? status;
  final String? data;

  CancelOrderResponseModel({
     this.success,
     this.status,
     this.data,
  });

  factory CancelOrderResponseModel.fromJson(Map<String, dynamic> json) {
    return CancelOrderResponseModel(
      success: json['success'],
      status: json['status'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'status': status,
      'data': data,
    };
  }
}