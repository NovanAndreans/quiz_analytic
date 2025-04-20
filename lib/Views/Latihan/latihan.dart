import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Components/Widgets/Settings/navbar.dart';

class LatihanPage extends StatelessWidget {
  const LatihanPage({super.key});

  final List<Map<String, dynamic>> availableQuizzes = const [
    {'title': 'Basis Data'},
    {'title': 'Matematika'},
    {'title': 'Bahasa Inggris'},
    {'title': 'Pemrograman Dasar'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
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
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      height: 65,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
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

              // ➕ Buat Kuis Baru
              ElevatedButton.icon(
                onPressed: () {
                  Get.toNamed('/create-latihan');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF387FFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  textStyle: const TextStyle(fontSize: 14),
                ),
                icon: const Icon(Icons.add, size: 16, color: Colors.white),
                label: const Text("Buat Kuis Baru", style: TextStyle(color: Colors.white),),
              ),
              const SizedBox(height: 16),

              // 📘 Quiz Cards
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.85,
                ),
                itemCount: availableQuizzes.length,
                itemBuilder: (context, index) {
                  final quiz = availableQuizzes[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          quiz['title'],
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black87),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed('/latihan-detail');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF387FFF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text("Kerjakan", style: TextStyle(color: Colors.white),),
                          ),
                        )
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
      bottomNavigationBar: const CustomNavbar(currentIndex: 2),
    );
  }
}
