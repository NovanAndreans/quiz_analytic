import 'package:flutter/material.dart';

class LatihanEvaluasi extends StatelessWidget {
  LatihanEvaluasi({super.key});

  final String soal = "Manakah pernyataan yang benar mengenai perbedaan antara basis data dan file system?";

  final List<String> options = [
    "File system lebih unggul dalam menjaga integritas data dibandingkan basis data.",
    "Basis data memiliki struktur yang lebih terorganisir dibandingkan file system.",
    "File system memungkinkan pengaturan hak akses lebih baik dibandingkan basis data.",
    "Basis data memiliki tingkat redundansi yang lebih tinggi dibandingkan file system.",
  ];

  final int selectedIndex = 2; // index jawaban yang dipilih user
  final int correctIndex = 1;  // index jawaban benar
  final int totalBenar = 1;
  final int totalSalah = 29;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: Column(
        children: [
          // AppBar custom
          Container(
            padding: const EdgeInsets.only(top: 48, left: 16, right: 16, bottom: 12),
            decoration: const BoxDecoration(
              color: Color(0xFF3A73DF),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.arrow_back, color: Colors.white),
                Text("Basis Data", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Icon(Icons.notifications_none, color: Colors.white),
                    SizedBox(width: 12),
                    Icon(Icons.person_outline, color: Colors.white),
                  ],
                )
              ],
            ),
          ),

          // Isi konten
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Soal", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("01", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                      Row(
                        children: [
                          const Text("Kesulitan : ", style: TextStyle(fontSize: 12)),
                          const Text("Sangat Sulit", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                          const SizedBox(width: 8),
                          Container(
                            width: 80,
                            height: 6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.grey.shade300,
                            ),
                            child: FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: 0.2,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    soal,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 20),

                  // List opsi dengan warna hasil
                  Column(
                    children: List.generate(options.length, (index) {
                      Color? bgColor;
                      Color textColor = Colors.black;

                      if (index == correctIndex) {
                        bgColor = Colors.green;
                        textColor = Colors.white;
                      } else if (index == selectedIndex && selectedIndex != correctIndex) {
                        bgColor = Colors.red;
                        textColor = Colors.white;
                      } else {
                        bgColor = Colors.white;
                        textColor = Colors.black;
                      }

                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Text(
                          options[index],
                          style: TextStyle(fontSize: 14, color: textColor),
                        ),
                      );
                    }),
                  ),

                  const Spacer(),

                  // Statistik
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Total Salah : $totalSalah", style: const TextStyle(color: Colors.red)),
                      const SizedBox(width: 16),
                      Text("Total Benar : $totalBenar", style: const TextStyle(color: Colors.green)),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Tombol Next
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text("Next", style: TextStyle(color: Colors.black87)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
