// login_model.dart

class LoginModel {
  final String email;
  final String password;

  LoginModel({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      "email": email.trim(),
      "password": password.trim(),
    };
  }

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }
}

// Response model
class LoginResponse {
  final bool status;
  final String message;

  LoginResponse({required this.status, required this.message});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'].toString().toLowerCase() == 'true' || json['status'].toString() == '1',
      message: json['message'] ?? '',
    );
  }
}
