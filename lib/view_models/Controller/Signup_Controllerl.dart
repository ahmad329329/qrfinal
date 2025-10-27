import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qrfinal/res/routes/routes_names.dart';
import '../../repository/login_repository/login_repository.dart';
import '../../utils/utils.dart';

class SignupController extends GetxController {
  final _api = LoginRepository();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  // ✅ Email & Password Validation
  bool validateCredentials() {
    String email = emailController.value.text.trim();
    String password = passwordController.value.text.trim();

    final emailRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*@).+$');
    final passwordRegex = RegExp(r'^.{8,}$');

    if (email.isEmpty) {
      Utils.snackbar('Error', 'Email cannot be empty');
      return false;
    } else if (!emailRegex.hasMatch(email)) {
      Utils.snackbar('Invalid Email', 'Email must contain lowercase, uppercase, and @');
      return false;
    }

    if (password.isEmpty) {
      Utils.snackbar('Error', 'Password cannot be empty');
      return false;
    } else if (!passwordRegex.hasMatch(password)) {
      Utils.snackbar('Invalid Password', 'Password must be at least 8 characters long');
      return false;
    }

    return true;
  }

  // ✅ Signup API Call
  void signupApi() {
    if (!validateCredentials()) return;

    loading.value = true;
    Get.toNamed(RouteName.homescreen);
  }
  //   Map<String, String> data = {
  //     "email": emailController.value.text.trim(),
  //     "password": passwordController.value.text.trim(),
  //   };
  //
  //   _api.loginapi(data).then((value) {
  //     loading.value = false;
  //     Utils.snackbar('Signup', 'Account created successfully!');
  //   }).onError((error, stackTrace) {
  //     log(error.toString());
  //     loading.value = false;
  //     Utils.snackbar('Failed', 'Signup failed');
  //   });
  // }
}
