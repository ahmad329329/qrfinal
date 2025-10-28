import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrfinal/res/routes/routes_names.dart';
import 'package:qrfinal/view_models/Controller/Home_Controller.dart';
import 'home_side_drawer.dart';
import 'home_containers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      drawer:  HomeSideDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("QR-based Attendance"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const Text("Welcome", style: TextStyle(fontSize: 18, color: Colors.black54)),
              Obx(() => Text(
                controller.name.value,
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              )),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 40),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.qr_code_scanner, size: 60, color: Colors.white),
                    SizedBox(height: 10),
                    Text(
                      "Scan QR Code",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    buildFeatureBox(
                      Icons.assignment_turned_in,
                      "Attendance Record",
                          () {
                        Get.toNamed(RouteName.attendencerecordscreen);
                      },
                    ),
                    buildFeatureBox(
                      Icons.bar_chart,
                      "Attendance Statistics",
                          () {
                        Get.toNamed(RouteName.attendencestaticticsscreen);
                      },
                    ),
                    buildFeatureBox(
                      Icons.notifications,
                      "Notifications",
                      () {
                        Get.toNamed(RouteName.notifcationscreen);
                      },
                    ),
                    buildFeatureBox(
                      Icons.schedule,
                      "Class Schedule",
                       () {
                         Get.toNamed(RouteName.classshedulescreen);
                       }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
