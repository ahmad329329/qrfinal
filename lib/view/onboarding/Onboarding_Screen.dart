import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrfinal/view_models/Controller/onboarding_Controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final OnboardingController controller = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${controller.currentPage.value + 1}/${controller.onboardingData.length}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: controller.skip,
                      child: Text("skip".tr, style: TextStyle(color: Colors.black)),
                    ),
                  ],
                );
              }),
            ),

            // PageView
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: controller.onboardingData.length,
                itemBuilder: (context, index) {
                  final data = controller.onboardingData[index];
                  return buildOnboardPage(
                    image: data["image"]!,
                    title: data["title"]!.tr,
                    desc: data["desc"]!.tr,
                  );
                },
              ),
            ),

            // Dot indicator
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.onboardingData.length,
                      (index) => buildDot(index, controller.currentPage.value),
                ),
              );
            }),

            const SizedBox(height: 20),

            // Navigation Buttons
            Obx(() {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    controller.currentPage.value == 0
                        ? const SizedBox(width: 60)
                        : TextButton(
                      onPressed: controller.previousPage,
                      child: Text("previous".tr, style: TextStyle(color: Colors.grey)),
                    ),
                    controller.currentPage.value == controller.onboardingData.length - 1
                        ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      onPressed: controller.skip,
                      child: Text("getstarted".tr, style: TextStyle(fontSize: 16, color: Colors.white)),
                    )
                        : TextButton(
                      onPressed: controller.nextPage,
                      child: Text("next".tr, style: TextStyle(color: Colors.blueAccent)),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  // Page content widget
  Widget buildOnboardPage({
    required String image,
    required String title,
    required String desc,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Image.asset(image, height: 300),
          const SizedBox(height: 30),
          Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Text(desc, textAlign: TextAlign.center, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  // Dot indicator widget
  Widget buildDot(int index, int currentPage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: currentPage == index ? 20 : 8,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.blueAccent : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

