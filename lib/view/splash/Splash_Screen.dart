import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrfinal/res/Colors/colors.dart';
import 'package:qrfinal/res/assets/image_assets.dart';
import 'package:qrfinal/view_models/Controller/splash_Controllerl.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});

  final SplashController splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.primarycolor,
      body: Center(
        child: Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              ImageAssets.splashscreen,
              height: 150,
            ),

            const SizedBox(height: 300),

            // Text
             Text(
              'loading'.tr,
              style: TextStyle(
                color: AppColor.whiteColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 20),

            // Linear loading bar
            Container(
              width: 250,
              height: 10,
              decoration: BoxDecoration(
                color: AppColor.whiteColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // Percentage text
            Text(
              "${(splashController.progress.value * 100).toInt()}%",
              style: const TextStyle(
                color: AppColor.whiteColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )),
      ));
  }
}
