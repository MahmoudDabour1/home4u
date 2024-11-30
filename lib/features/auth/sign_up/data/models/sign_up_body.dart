class SignUpBody {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  final UserTypeRequest userType;

  SignUpBody({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.userType,
  });

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phone": phone,
      "password": password,
      "userType": userType.toJson(),
    };
  }
}

class UserTypeRequest {
  final int id;
  final String code;

  UserTypeRequest({
    required this.id,
    required this.code,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "code": code,
    };
  }
}
