
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../repository/login_repository/login_repository.dart';
import '../../utils/utils.dart';

class SignupController extends GetxController{

  final _api =LoginRepository();
  final emailController= TextEditingController().obs;
  final passwordController= TextEditingController().obs;

  final emailFocusMode=FocusNode().obs;
  final passwordFocusMode=FocusNode().obs;

  RxBool loading= false.obs;


}