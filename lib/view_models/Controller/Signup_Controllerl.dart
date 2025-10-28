import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qrfinal/repository/Signup_repository/signup_repository.dart';
import 'package:qrfinal/res/routes/routes_names.dart';
import '../../utils/utils.dart';

class SignupController extends GetxController {
  final _api = SignupRepository();

  // ✅ Controllers
  final nameController = TextEditingController().obs;
  final regNoController = TextEditingController().obs;
  final degreeController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  // ✅ Focus Nodes
  final nameFocusNode = FocusNode().obs;
  final regNoFocusNode = FocusNode().obs;
  final degreeFocusNode = FocusNode().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  // ✅ Input Validation
  bool validateCredentials() {
    String name = nameController.value.text.trim();
    String regNo = regNoController.value.text.trim();
    String degree = degreeController.value.text.trim();
    String email = emailController.value.text.trim();
    String password = passwordController.value.text.trim();

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    final passwordRegex = RegExp(r'^.{8,}$');

    if (name.isEmpty) {
      Utils.snackbar('Error', 'Name cannot be empty');
      return false;
    }

    if (regNo.isEmpty) {
      Utils.snackbar('Error', 'Registration Number cannot be empty');
      return false;
    }

    if (degree.isEmpty) {
      Utils.snackbar('Error', 'Degree cannot be empty');
      return false;
    }

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

  // ✅ Signup API
  void signupApi() async {
    if (!validateCredentials()) return;

    loading.value = true;

    var data = {
      "name": nameController.value.text.trim(),
      "reg_no": regNoController.value.text.trim(),
      "degree": degreeController.value.text.trim(),
      "email": emailController.value.text.trim(),
      "password": passwordController.value.text.trim(),
    };

    try {
      var response = await _api.signup(data);

      var status = response['status'].toString().trim();
      var message = response['message'] ?? 'No message from server';

      if (status == 'success' || status == 'true' || status == '1') {
        Utils.snackbar('Success', message);
        Get.offAllNamed(RouteName.homescreen); // ✅ go to home after signup
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
