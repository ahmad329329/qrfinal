import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qrfinal/res/getx_localization/languages.dart';
import 'package:qrfinal/res/routes/routes.dart';
import 'package:qrfinal/res/routes/routes_names.dart';
import 'package:qrfinal/view_models/bindings/splash_Bindings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    bool isLoggedIn = storage.read('isLoggedIn') ?? false;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: SplashViewBinding(),
      title: 'QR Scanning App',
      translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      initialRoute: isLoggedIn ? RouteName.homescreen : RouteName.splashScreen,
      getPages: AppRoute.approutes(),
    );
  }
}

