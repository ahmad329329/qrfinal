// signup_model.dart

class SignupModel {
  final String name;
  final String regNo;
  final String degree;
  final String email;
  final String password;

  SignupModel({
    required this.name,
    required this.regNo,
    required this.degree,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name.trim(),
      "reg_no": regNo.trim(),
      "degree": degree.trim(),
      "email": email.trim(),
      "password": password.trim(),
    };
  }

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      name: json['name'] ?? '',
      regNo: json['reg_no'] ?? '',
      degree: json['degree'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }
}

class SignupResponse {
  final bool status;
  final String message;

  SignupResponse({required this.status, required this.message});

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    return SignupResponse(
      status: json['status'].toString().toLowerCase() == 'true' || json['status'].toString() == '1',
      message: json['message'] ?? '',
    );
  }
}
