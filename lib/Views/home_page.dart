import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Components/Widgets/Settings/appbar.dart';
import '../Components/Widgets/Settings/navbar.dart';
import '../Controllers/auth_controller.dart'; // Assuming you have AuthController for managing the logout

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> courseProgress = const [
    {'title': 'Basis Data', 'progress': 0.27},
    {'title': 'Matematika', 'progress': 0.0},
    {'title': 'Java', 'progress': 0.48},
    {'title': 'Pemrograman', 'progress': 0.91},
  ];

  @override
  Widget build(BuildContext context) {
    final AuthController authController =
        Get.find<AuthController>(); // Access AuthController for logout
    final userName =
        authController.currentUser?['name'] ??
        'User'; // Get user name or default to 'User'

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              const SizedBox(height: 16),
              CustomAppBar(judul: "Beranda"),
              const SizedBox(height: 24),

              // 👋 Greeting and Streak
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 4),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello $userName,",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                          const Text(
                            "Ayo Belajar!",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 4),
                        ],
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Streak",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Text(
                            "168 Hari",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // 📘 Section Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Pembelajaranmu",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF387FFF),
                    ),
                  ),
                  Icon(Icons.grid_view_rounded, color: Colors.black38),
                ],
              ),
              const SizedBox(height: 16),

              // 🧠 Grid of Course Cards
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.85,
                ),
                itemCount: courseProgress.length,
                itemBuilder: (context, index) {
                  final course = courseProgress[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 4),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.menu_book,
                          color: Color(0xFF387FFF),
                          size: 36,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          course['title'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF387FFF),
                          ),
                        ),
                        const SizedBox(height: 12),
                        LinearProgressIndicator(
                          value: course['progress'],
                          minHeight: 8,
                          backgroundColor: Colors.grey.shade300,
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${(course['progress'] * 100).toStringAsFixed(0)}%",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavbar(currentIndex: 0),
    );
  }
}
