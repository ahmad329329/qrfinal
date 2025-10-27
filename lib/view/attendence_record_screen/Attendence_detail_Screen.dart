import 'package:flutter/material.dart';

class AttendanceDetailScreen extends StatelessWidget {
  final String subject;
  final String teacher;
  final String date;
  final String status;
  final String comments;

  const AttendanceDetailScreen({
    super.key,
    required this.subject,
    required this.teacher,
    required this.date,
    required this.status,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    final color = _getStatusColor(status);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Attendance Detail"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Subject: $subject",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text("Teacher: $teacher", style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                Text("Date: $date", style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                Text("Status: $status", style: TextStyle(fontSize: 16, color: color)),
                const Divider(height: 30),
                const Text("Teacher's Comments:",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(comments, style: const TextStyle(fontSize: 15)),
              ],
            ),
          ),
        ),
      ),
    );
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
}
