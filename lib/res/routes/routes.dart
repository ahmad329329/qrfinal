

import 'package:get/get.dart';
import 'package:qrfinal/res/routes/routes_names.dart';
import 'package:qrfinal/view/login/Login_Screen.dart';
import 'package:qrfinal/view/onboarding/Onboarding_Screen.dart';

import 'package:qrfinal/view/splash/Splash_Screen.dart';
import 'package:qrfinal/view_models/bindings/Loign_Bindings.dart';
import 'package:qrfinal/view_models/bindings/Onboarding_Bindings.dart';
import 'package:qrfinal/view_models/bindings/splash_Bindings.dart';

class AppRoute{

  static approutes() =>[
    GetPage(name: RouteName.splashScreen, page: () => SplashScreen(),
    transition: Transition.leftToRightWithFade,
    binding: SplashViewBinding(),
    transitionDuration: Duration(microseconds: 250)),

    GetPage(name: RouteName.onboardingscreen, page: () => OnboardingScreen(),
        transition: Transition.leftToRightWithFade,
        binding: OnboardingBindings(),
        transitionDuration: Duration(microseconds: 250)),


    GetPage(name: RouteName.loginview, page: () => LoginScreen(),
        transition: Transition.leftToRightWithFade,
        binding: LoginViewBinding(),
        transitionDuration: Duration(microseconds: 250))
  ];

}