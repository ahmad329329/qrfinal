import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrfinal/res/assets/image_assets.dart';
import 'package:qrfinal/res/routes/routes_names.dart';


class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  RxInt currentPage = 0.obs;

  final List<Map<String, String>> onboardingData = [
    {
      "image": ImageAssets.omboading1,
      "title": 'onboarding_title1',
      "desc": 'onboarding_desc1',
    },
    {
      "image": ImageAssets.omboading2,
      "title": 'onboarding_title2',
      "desc": 'onboarding_desc2',
    },
    {
      "image": ImageAssets.omboading3,
      "title": 'onboarding_title3',
      "desc": 'onboarding_desc3',
    },
  ];

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < onboardingData.length - 1) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut);
    } else {
      Get.offAllNamed(RouteName.loginview);
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      pageController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut);
    }
  }

  void skip() {
    Get.offAllNamed(RouteName.loginview);
  }
}
