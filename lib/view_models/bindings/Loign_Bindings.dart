

import 'package:get/get.dart';
import 'package:qrfinal/view_models/Controller/login_Controllerl.dart';


class LoginViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
