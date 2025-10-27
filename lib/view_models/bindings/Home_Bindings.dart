

import 'package:get/get.dart';
import 'package:qrfinal/view_models/Controller/Home_Controller.dart';
import 'package:qrfinal/view_models/Controller/login_Controllerl.dart';


class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
