

import 'package:get/get.dart';
import 'package:qrfinal/res/routes/routes_names.dart';
import 'package:qrfinal/view/Home_Screen/Home_Screen.dart';
import 'package:qrfinal/view/Notifcation_Screen/Notifcation_Screen.dart';
import 'package:qrfinal/view/attendence_record_screen/Attendence_Screen.dart';
import 'package:qrfinal/view/attendence_statatics_screen/Attendence_Statictics_Screen.dart';
import 'package:qrfinal/view/class_shedule_screen/Class_Shedule_Screen.dart';
import 'package:qrfinal/view/login/Login_Screen.dart';
import 'package:qrfinal/view/onboarding/Onboarding_Screen.dart';
import 'package:qrfinal/view/signup/Signup_Screen.dart';

import 'package:qrfinal/view/splash/Splash_Screen.dart';
import 'package:qrfinal/view_models/Controller/Signup_Controllerl.dart';
import 'package:qrfinal/view_models/bindings/Loign_Bindings.dart';
import 'package:qrfinal/view_models/bindings/Onboarding_Bindings.dart';
import 'package:qrfinal/view_models/bindings/Signup_Bindings.dart';
import 'package:qrfinal/view_models/bindings/splash_Bindings.dart';

import '../../view_models/bindings/Attendence_Screen_Bindings.dart';
import '../../view_models/bindings/Home_Bindings.dart';

class AppRoute{

  static approutes() =>[
    GetPage(name: RouteName.splashScreen, page: () => SplashScreen(),
    transition: Transition.leftToRightWithFade,
    binding: SplashViewBinding(),
    transitionDuration: Duration(microseconds: 250)),

    GetPage(name: RouteName.onboardingscreen, page: () => OnboardingScreen(),
        transition: Transition.leftToRightWithFade,
        binding: OnboardingViewBindings(),
        transitionDuration: Duration(microseconds: 250)),

    GetPage(name: RouteName.loginview, page: () => LoginScreen(),
        transition: Transition.leftToRightWithFade,
        binding: LoginViewBinding(),
        transitionDuration: Duration(microseconds: 250)),

    GetPage(name: RouteName.signupscreen, page: () => SignupScreen(),
        transition: Transition.leftToRightWithFade,
        binding:SignupViewBindings(),
        transitionDuration: Duration(microseconds: 250)),

    GetPage(name: RouteName.homescreen, page: () => HomeScreen(),
        transition: Transition.leftToRightWithFade,
        binding:HomeBindings(),
        transitionDuration: Duration(microseconds: 250)),

    GetPage(name: RouteName.attendencerecordscreen, page: () => AttendanceRecordScreen(),
        transition: Transition.leftToRightWithFade,
        binding: AttendenceScreenBindings(),
        transitionDuration: Duration(microseconds: 250)),

    GetPage(name: RouteName.attendencestaticticsscreen, page: () => AttendanceStatisticsScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250)),

    GetPage(name: RouteName.notifcationscreen, page: () => NotificationScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250)),

    GetPage(name: RouteName.classshedulescreen, page: () => ClassScheduleScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250)),

  ];

}