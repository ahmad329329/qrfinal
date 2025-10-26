

import 'package:get/get.dart';
import 'package:qrfinal/view_models/Controller/Signup_Controllerl.dart';



class LoginViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());

  }
}
