import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Components/Widgets/Settings/navbar.dart';

class MateriPage extends StatelessWidget {
  const MateriPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFF),
      appBar: AppBar(
        title: const Text('Materi', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none, color: Colors.grey)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.person, color: Colors.grey)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 8),
            // 🔍 Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Belajar apa hari ini?',
                  icon: Icon(Icons.search),
                ),
              ),
            ),

            const SizedBox(height: 24),
            // 🧩 Filter Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Filter', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                Row(
                  children: [
                    Icon(Icons.grid_view_rounded, color: Colors.grey),
                    SizedBox(width: 10,),
                    Icon(Icons.list_rounded, color: Colors.grey),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16),
            // 🗂 Daftar Materi Cards
            SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Get.toNamed('/materi-detail-list'),
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                      ),
                      child: const Center(
                        child: Text("DAFTAR MATERI", textAlign: TextAlign.center),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 32),
            const Text(
              'Rekomendasi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF387FFF),
              ),
            ),
            const SizedBox(height: 16),
            // 🎯 Rekomendasi Materi
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 3 / 4,
              ),
              itemCount: 2,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () => Get.toNamed('/materi-detail-list'),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                    ),
                    child: const Center(
                      child: Text("REKOMENDASI MATERI", textAlign: TextAlign.center),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavbar(
        currentIndex: 1,
      ),
    );
  }
}
