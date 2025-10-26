

import 'package:get/get.dart';
import 'package:qrfinal/view_models/Controller/Signup_Controllerl.dart';



class SignupViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());

  }
}
