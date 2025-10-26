

import 'package:get/get.dart';
import 'package:qrfinal/view/onboarding/Onboarding_Screen.dart';
import 'package:qrfinal/view_models/Controller/login_Controllerl.dart';
import 'package:qrfinal/view_models/Controller/onboarding_Controller.dart';


class OnboardingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController());
  }
}
