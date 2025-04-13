import 'package:flutter/material.dart';

class MateriDetailPage extends StatelessWidget {
  const MateriDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFF),
      appBar: AppBar(
        title: const Text("Basis Data"),
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
            const Text(
              "Materi",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Progress Bar
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: 0.3,
                minHeight: 10,
                backgroundColor: Colors.grey.shade300,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              "Pengenalan Basis Data",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            const Text(
              "Pengertian Basis Data",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              "Basis data adalah kumpulan data yang terorganisir dan dapat diakses, dikelola, serta diperbarui dengan mudah. Basis data digunakan untuk menyimpan informasi secara sistematis agar dapat digunakan secara efisien.",
              style: TextStyle(height: 1.5),
            ),

            const SizedBox(height: 16),
            const Text(
              "Komponen Basis Data",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              '''1. Data – Informasi yang disimpan dalam basis data.
2. Perangkat Keras (Hardware) – Komputer, server, dan penyimpanan yang digunakan.
3. Perangkat Lunak (Software) – Sistem manajemen basis data (DBMS) seperti MySQL, PostgreSQL, MongoDB.
4. Pengguna (User) – Administrator, developer, dan pengguna akhir.
5. Prosedur – Aturan dan kebijakan dalam pengelolaan basis data.''',
              style: TextStyle(height: 1.5),
            ),

            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Get.toNamed('/materi-next');
                },
                child: const Text(
                  "Next",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
