import 'dart:async';

import 'package:get/get.dart';

import '../../res/routes/routes_names.dart';

class SplashServies{

  void isLogin(){
  Timer(const Duration(seconds: 3) ,
      () => Get.toNamed(RouteName.loginview));
  }
}