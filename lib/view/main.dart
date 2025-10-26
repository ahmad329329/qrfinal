import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrfinal/res/getx_localization/languages.dart';
import 'package:qrfinal/res/routes/routes.dart';
import 'package:qrfinal/res/routes/routes_names.dart';
import 'package:qrfinal/view_models/bindings/splash_Bindings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: SplashViewBinding(),
      title: 'QR Scanning App',
      translations: Languages(),
      locale: Locale('en' ,'US'),
      fallbackLocale: Locale('en' ,'US'),
      initialRoute: RouteName.splashScreen,
      getPages: AppRoute.approutes(),
    );
  }
}
