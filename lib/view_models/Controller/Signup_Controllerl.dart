import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qrfinal/repository/Signup_repository/signup_repository.dart';
import 'package:qrfinal/res/routes/routes_names.dart';
import '../../utils/utils.dart';

class SignupController extends GetxController {
  final _api = SignupRepository();

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

  void signupApi() async {
    if (!validateCredentials()) return;

    loading.value = true;

    var data = {
      "email": emailController.value.text.trim(),
      "password": passwordController.value.text.trim(),
    };

    try {
      var response = await _api.signup(data);

      var status = response['status'].toString().trim();
      var message = response['message'] ?? 'No message from server';

      if (status == 'success' || status == 'true' || status == '1') {
        Utils.snackbar('Success', message);
        Get.offAllNamed(RouteName.homescreen); // ✅ go to login after signup
      } else {
        Utils.snackbar('Error', message);
      }
    } catch (e) {
      log('Signup error: $e');
      Utils.snackbar('Error', 'Something went wrong');
    } finally {
      loading.value = false;
    }
  }
}
