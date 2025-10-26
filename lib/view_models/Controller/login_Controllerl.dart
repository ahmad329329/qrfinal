
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../repository/login_repository/login_repository.dart';
import '../../utils/utils.dart';

class LoginController extends GetxController{

  final _api =LoginRepository();
  final emailController= TextEditingController().obs;
  final passwordController= TextEditingController().obs;

  final emailFocusMode=FocusNode().obs;
  final passwordFocusMode=FocusNode().obs;

  RxBool loading= false.obs;

  void loginApi() {
    loading.value = true;
    Map data ={
      "email": emailController.value.text,
      "password": passwordController.value.text,

    };
    _api.loginapi(data).then((value) {
      loading.value=false;
      Utils.snackbar('login', 'login successfull');
    }).onError((error, stackTrace) {
      log(error.toString());
      loading.value=false;
      Utils.snackbar('failed', 'login failed');
    });
  }

}