import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MateriDetailList extends StatelessWidget {
  const MateriDetailList({super.key});

  final List<Map<String, dynamic>> materi = const [
    {"judul": "Pengenalan Basis Data", "progress": 88},
    {"judul": "Model & Perancangan Basis Data", "progress": 50},
    {"judul": "Structured Query Language (SQL)", "progress": 12},
    {"judul": "Manajemen Basis Data & Optimasi", "progress": 0},
    {"judul": "Keamanan dan Keandalan Basis Data", "progress": 0},
    {"judul": "Basis Data Terdistribusi & Big Data", "progress": 0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.grey),
        title: const Text(
          'Detail Materi',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        actions: const [
          Icon(Icons.notifications_none, color: Colors.grey),
          SizedBox(width: 12),
          Icon(Icons.person_outline, color: Colors.grey),
          SizedBox(width: 12),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF548EF2),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Basis Data", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("Pilih materimu!", style: TextStyle(fontSize: 14, color: Colors.white70)),
                SizedBox(height: 12),
                Text("15 Materi", style: TextStyle(fontSize: 14, color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: materi.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = materi[index];
                return GestureDetector(
                  onTap: () => Get.toNamed("/materi-detail"),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '01. ${item['judul']}',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        LinearProgressIndicator(
                          value: (item['progress'] ?? 0) / 100,
                          minHeight: 8,
                          backgroundColor: Colors.grey[300],
                          valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF7CE48A)),
                        ),
                        const SizedBox(height: 4),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "${item['progress']}%",
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
