import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,

      // 🟦 Drawer Added Here
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
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
            _buildDrawerItem(Icons.home, "Home", context),
            _buildDrawerItem(Icons.qr_code_scanner, "Scan QR Code", context),
            _buildDrawerItem(Icons.assignment_turned_in, "Attendance Record", context),
            _buildDrawerItem(Icons.bar_chart, "Statistics", context),
            _buildDrawerItem(Icons.settings, "Settings", context),
            const Divider(),
            _buildDrawerItem(Icons.logout, "Logout", context, color: Colors.red),
          ],
        ),
      ),

      // 🟦 Main Body
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

              // App title
              Text(
                "QR-based",
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Attendance System",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 30),

              // Scan QR Section
              Container(
                padding: const EdgeInsets.symmetric(vertical: 40),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: const [
                    Icon(Icons.qr_code_scanner,
                        size: 60, color: Colors.white),
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

              // Buttons Grid
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    _buildFeatureBox(Icons.assignment_turned_in, "Attendance Record"),
                    _buildFeatureBox(Icons.bar_chart, "Attendance Statistics"),
                    _buildFeatureBox(Icons.notifications, "Notifications"),
                    _buildFeatureBox(Icons.person, "Profile"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Drawer Item Widget
  static Widget _buildDrawerItem(IconData icon, String title, BuildContext context, {Color color = Colors.black87}) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: TextStyle(color: color, fontSize: 15)),
      onTap: () {
        Navigator.pop(context); // close drawer
        // Navigation logic can be added here
      },
    );
  }

  // Feature Box Widget
  Widget _buildFeatureBox(IconData icon, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.blue, size: 40),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
