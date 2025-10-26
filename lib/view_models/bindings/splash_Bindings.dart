

import 'package:get/get.dart';
import 'package:qrfinal/view_models/Controller/splash_Controllerl.dart';

class SplashViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
