class SignUpResponse {
  final bool success;
  final int status;
  final String data;

  SignUpResponse({
    required this.success,
    required this.status,
    required this.data,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      success: json["success"],
      status: json["status"],
      data: json["data"],
    );
  }
}
