class ServiceUpdateDeleteResponseModel {
  ServiceUpdateDeleteResponseModel({
      this.success, 
      this.status, 
      this.data,});

  ServiceUpdateDeleteResponseModel.fromJson(dynamic json) {
    success = json['success'];
    status = json['status'];
    data = json['data'];
  }
  bool? success;
  int? status;
  bool? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['status'] = status;
    map['data'] = data;
    return map;
  }
}