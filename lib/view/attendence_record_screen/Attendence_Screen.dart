import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Attendence_detail_Screen.dart';

class AttendanceRecordScreen extends StatelessWidget {
   AttendanceRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example data (you can replace this with API data later)
    final Map<String, List<Map<String, String>>> monthlyAttendance = {
      "Oct 21, 2025": [
        {"subject": "Mobile App Development", "teacher": "Sir Usman Ali", "status": "Present"},
        {"subject": "Database Systems", "teacher": "Sir Ahmed Khan", "status": "Absent"},
        {"subject": "Software Testing", "teacher": "Sir Bilal", "status": "Late"},
        {"subject": "Operating Systems", "teacher": "Sir Kamran", "status": "Present"},
      ],
      "Oct 22, 2025": [
        {"subject": "AI Fundamentals", "teacher": "Miss Hina", "status": "Present"},
        {"subject": "Software Engineering", "teacher": "Sir Usman Ali", "status": "Present"},
        {"subject": "Discrete Math", "teacher": "Sir Waseem", "status": "Absent"},
      ],
      "Oct 23, 2025": [
        {"subject": "Data Structures", "teacher": "Sir Imran", "status": "Late"},
        {"subject": "Compiler Design", "teacher": "Sir Ali", "status": "Present"},
        {"subject": "Software Testing", "teacher": "Sir Bilal", "status": "Present"},
        {"subject": "Operating Systems", "teacher": "Sir Kamran", "status": "Absent"},
      ],
    };

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Monthly Attendance"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Center(
              child: Text(
                "October 2025",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Loop for each day
            ...monthlyAttendance.entries.map((entry) {
              final date = entry.key;
              final lectures = entry.value;

              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        date,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const Divider(),
                      ...lectures.map((lecture) {
                        final status = lecture["status"]!;
                        final color = _getStatusColor(status);
                        final icon = _getStatusIcon(status);

                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(icon, color: color, size: 30),
                          title: Text(
                            lecture["subject"]!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "Teacher: ${lecture["teacher"]!} | Status: $status",
                            style: TextStyle(color: color, fontSize: 13),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {
                            Get.to(() => AttendanceDetailScreen(
                              subject: lecture["subject"]!,
                              teacher: lecture["teacher"]!,
                              date: date,
                              status: status,
                              comments: _getComment(status),
                            ));
                          },
                        );
                      }).toList(),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  // Helper Methods
  IconData _getStatusIcon(String status) {
    switch (status) {
      case "Present":
        return Icons.check_circle;
      case "Absent":
        return Icons.cancel;
      case "Late":
        return Icons.access_time;
      default:
        return Icons.help_outline;
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "Present":
        return Colors.green;
      case "Absent":
        return Colors.red;
      case "Late":
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  String _getComment(String status) {
    switch (status) {
      case "Present":
        return "Attended the class on time and participated well.";
      case "Absent":
        return "Did not attend this lecture.";
      case "Late":
        return "Arrived late but attended most of the session.";
      default:
        return "No comment available.";
    }
  }
}
