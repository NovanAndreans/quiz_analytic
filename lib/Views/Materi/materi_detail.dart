import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MateriDetailPage extends StatelessWidget {
  const MateriDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the 'point' argument passed from the previous screen
    final point = Get.arguments['point']; // Get the point data

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFF),
      appBar: AppBar(
        title: const Text("Detail Materi"),
        backgroundColor: const Color(0xFF387FFF),
        elevation: 0,
        actions: const [
          Icon(Icons.notifications_none, color: Colors.white),
          SizedBox(width: 16),
          Icon(Icons.person_outline, color: Colors.white),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: ListView(
          children: [
            // Display the point data (you can adjust this based on the structure of your point)
            Text(
              point['title'] ?? 'Loading...',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Example: Displaying a progress bar based on point data (you can adjust the logic based on your data)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: 0.5,  // You can set this dynamically based on your data
                minHeight: 10,
                backgroundColor: Colors.grey.shade300,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 24),

            Text(
              point['content'] ?? 'No description available.',
              style: const TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
