import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrfinal/res/routes/routes_names.dart'; // only if you’re using GetX navigation

class HomeSideDrawer extends StatelessWidget {
  const HomeSideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 50, color: Colors.blue),
                ),
                SizedBox(height: 10),
                Text(
                  "Muhammad Ahmad",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Student",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Drawer Items
          _buildDrawerItem(Icons.home, "Home", () {
            Get.back();
          }),
          _buildDrawerItem(Icons.qr_code_scanner, "Scan QR Code", () {
            // Add navigation here if needed
          }),
          _buildDrawerItem(Icons.assignment_turned_in, "Attendance Record", () {
            // Get.toNamed(RouteName.attendanceView);
          }),
          _buildDrawerItem(Icons.bookmark_remove_outlined, "About Us", () {
            // Get.toNamed(RouteName.aboutUsView);
          }),
          _buildDrawerItem(Icons.settings, "Settings", () {
            // Get.toNamed(RouteName.settingsView);
          }),

          const Divider(),
          _buildDrawerItem(Icons.logout, "Logout", () {
            // Example logout navigation
            Get.offAllNamed(RouteName.loginview);
          }, color: Colors.red),
        ],
      ),
    );
  }

  // Drawer Item Builder
  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap,
      {Color color = Colors.black87}) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: TextStyle(color: color, fontSize: 15),
      ),
      onTap: onTap,
    );
  }
}
