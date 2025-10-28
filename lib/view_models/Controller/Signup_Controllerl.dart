import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qrfinal/repository/Signup_repository/signup_repository.dart';
import 'package:qrfinal/res/routes/routes_names.dart';
import '../../models/signup_model.dart';
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

    var signupData = SignupModel(
      name: nameController.value.text,
      regNo: regNoController.value.text,
      degree: degreeController.value.text,
      email: emailController.value.text,
      password: passwordController.value.text,
    );

    try {
      var response = await _api.signup(signupData.toJson());

      var signupResponse = SignupResponse.fromJson(response);

      if (signupResponse.status) {
        Utils.snackbar('Success', signupResponse.message);
        Get.offAllNamed(RouteName.homescreen);
      } else {
        Utils.snackbar('Error', signupResponse.message);
      }
    } catch (e) {
      log('Signup error: $e');
      Utils.snackbar('Error', 'Something went wrong');
    } finally {
      loading.value = false;
    }
  }

}
