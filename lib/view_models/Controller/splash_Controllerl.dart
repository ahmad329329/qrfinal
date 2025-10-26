import 'dart:async';
import 'package:get/get.dart';
import 'package:qrfinal/res/routes/routes_names.dart';
import 'package:qrfinal/view/onboarding/Onboarding_Screen.dart';
import 'package:qrfinal/view_models/Controller/onboarding_Controller.dart';

class SplashController extends GetxController {
  var progress = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    startLoading();
  }

  void startLoading() {
    Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (progress.value < 1.0) {
        progress.value += 0.1;

        // Clamp to ensure it never exceeds 1.0
        if (progress.value > 1.0) {
          progress.value = 1.0;
        }
      } else {
        timer.cancel();
        Get.offNamed(RouteName.onboardingscreen);
        // Get.off(() {
        //
        //   return OnboardingScreen();
        // });
      }
    });
  }
}
