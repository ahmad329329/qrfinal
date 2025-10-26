import 'package:get/get.dart';
import 'package:qrfinal/view_models/Controller/onboarding_Controller.dart';


class OnboardingViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController());
  }
}
