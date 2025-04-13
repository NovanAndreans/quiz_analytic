import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Components/Widgets/Forms/custom_button.dart';
import '../../Controllers/latihan_controller.dart';

class LatihanDetail extends StatelessWidget {
  LatihanDetail({super.key});

  final LatihanController controller = Get.put(LatihanController());

  final List<String> options = [
    "File system lebih unggul dalam menjaga integritas data dibandingkan basis data.",
    "Basis data memiliki struktur yang lebih terorganisir dibandingkan file system.",
    "File system memungkinkan pengaturan hak akses lebih baik dibandingkan basis data.",
    "Basis data memiliki tingkat redundansi yang lebih tinggi dibandingkan file system.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: Column(
        children: [
          // App Bar custom
          Container(
            padding: const EdgeInsets.only(
              top: 48,
              left: 16,
              right: 16,
              bottom: 12,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF3A73DF),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.arrow_back, color: Colors.white),
                Text(
                  "Basis Data",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.notifications_none, color: Colors.white),
                    SizedBox(width: 12),
                    Icon(Icons.person_outline, color: Colors.white),
                  ],
                ),
              ],
            ),
          ),

          // Soal
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Soal",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "01",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Manakah pernyataan yang benar mengenai perbedaan antara basis data dan file system?",
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 12),

                  // Timer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "10 Detik",
                        style: TextStyle(color: Colors.red),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: 0.2,
                          backgroundColor: Colors.grey[300],
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Colors.red,
                          ),
                          minHeight: 4,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Pilihan jawaban (Reactive)
                  Obx(() {
                    return Column(
                      children: List.generate(options.length, (index) {
                        final isSelected =
                            controller.selectedIndex.value == index;
                        return GestureDetector(
                          onTap: () => controller.pilihJawaban(index),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color:
                                  isSelected
                                      ? const Color(0xFF3A73DF)
                                      : Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Text(
                              options[index],
                              style: TextStyle(
                                color:
                                    isSelected ? Colors.white : Colors.black87,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  }),

                  const Spacer(),

                  // Tombol next
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        if (controller.selectedIndex.value != null) {
                          debugPrint(
                            "Dipilih: ${options[controller.selectedIndex.value!]}",
                          );
                          // lanjut ke soal berikutnya
                        }
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),

                  const Spacer(),

                  CustomButton(
                    onPressed: () => Get.toNamed('/latihan-evaluasi'),
                    text: "Cek Halaman Evaluasi",
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
