import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qrfinal/res/routes/routes_names.dart';
import '../../models/login_model.dart';
import '../../repository/login_repository/login_repository.dart';
import '../../utils/utils.dart';

class LoginController extends GetxController {
  final _api = LoginRepository();
  final storage = GetStorage();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  // ✅ Unified Input Validation
  bool validateCredentials() {
    String email = emailController.value.text.trim();
    String password = passwordController.value.text.trim();

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    final passwordRegex = RegExp(r'^.{8,}$');

    if (email.isEmpty) {
      Utils.snackbar('Error', 'Email cannot be empty');
      return false;
    } else if (!emailRegex.hasMatch(email)) {
      Utils.snackbar('Invalid Email', 'Please enter a valid email address');
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

  void loginApi() async {
    if (!validateCredentials()) return;

    loading.value = true;

    var loginData = LoginModel(
      email: emailController.value.text,
      password: passwordController.value.text,
    );

    try {
      var response = await _api.loginapi(loginData.toJson());

      var loginResponse = LoginResponse.fromJson(response);

      if (loginResponse.status) {
        Utils.snackbar('Success', loginResponse.message);
        storage.write('isLoggedIn', true);
        storage.write('email', loginData.email);
        Get.offAllNamed(RouteName.homescreen);
      } else {
        Utils.snackbar('Error', loginResponse.message);
      }
    } catch (e) {
      log('Login error: $e');
      Utils.snackbar('Error', 'Something went wrong');
    } finally {
      loading.value = false;
    }
  }

}
