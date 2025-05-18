import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_analytic/Controllers/quiz_controller.dart';
import '../../Components/Widgets/Settings/navbar.dart';

class LatihanPage extends StatelessWidget {
  const LatihanPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan instance QuizController
    final QuizController quizController = Get.put(QuizController());

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Obx(() {
            // Cek apakah data kuis sudah dimuat
            if (quizController.quizzesList.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView(
              children: [
                const SizedBox(height: 16),
                // 🔔 Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Home",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Icon(Icons.notifications_none, color: Colors.black45),
                        SizedBox(width: 12),
                        Icon(Icons.person_outline, color: Colors.black45),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 24),

                // 👋 Greeting & Empty Streak Card
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hello Novan,",
                                style: TextStyle(fontSize: 14, color: Colors.black87)),
                            Text("Ayo Belajar!",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // 🎯 Kuis Tersedia
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "KUIS TERSEDIA",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF387FFF)),
                    ),
                    Icon(Icons.grid_view_rounded, color: Colors.black38),
                  ],
                ),
                const SizedBox(height: 8),

                // 📘 Quiz Cards
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1, // Ensuring equal aspect ratio for each card
                  ),
                  itemCount: quizController.quizzesList.length, // Use quizzesList here
                  itemBuilder: (context, index) {
                    final quiz = quizController.quizzesList[index]; // Access quiz from quizzesList
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                      ),
                      padding: const EdgeInsets.all(8), // Reduced padding to prevent overflow
                      height: 250,  // Fixed height for each quiz card
                      child: Column(
                        mainAxisSize: MainAxisSize.min,  // Ensure Column only takes up required space
                        children: [
                          // Display quiz title with overflow handling
                          Flexible(
                            child: Text(
                              quiz.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.black87),
                              textAlign: TextAlign.center, // Center the title
                              overflow: TextOverflow.ellipsis, // Handle overflow
                              maxLines: 2, // Limit to 2 lines, avoid title getting too big
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Display cover image with fixed height
                          if (quiz.cover.url.isNotEmpty)
                            Container(
                              height: 80, // Fixed height for cover image (reduced size)
                              width: double.infinity,
                              child: Image.network(
                                quiz.cover.url,
                                fit: BoxFit.cover,
                              ),
                            ),
                          const SizedBox(height: 8),
                          // Kerjakan button with reduced size
                          Expanded(
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Navigate to quiz details page with the quiz ID
                                  Get.toNamed('/latihan-detail', arguments: quiz.id);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF387FFF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text("Kerjakan", style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
              ],
            );
          }),
        ),
      ),
      bottomNavigationBar: const CustomNavbar(currentIndex: 2),
    );
  }
}
