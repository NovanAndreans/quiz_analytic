import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/materi_detail_controller.dart';
import '../../Services/lesson_service.dart';

class MateriDetailList extends StatelessWidget {
  const MateriDetailList({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve lessonId passed from the previous screen
    final int lessonId = Get.arguments['lessonId']; // Accessing the arguments

    // Get instance of MateriDetailController
    final MateriDetailController controller = Get.put(
      MateriDetailController(lessonService: LessonService()),
    );

    // Fetch lesson data when the screen is first loaded
    controller.fetchLessonData(lessonId); // Use dynamic lessonId here

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF548EF2),
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: const Text(
          'Detail Materi',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        return Column(
          children: [
            // Header Section with Lesson Info
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF548EF2),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.lessonData['title'] ?? 'Loading...',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    controller.lessonData['desc'] ?? 'Loading description...',
                    style: const TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "${controller.lessonData['points']?.length ?? 0} Materi", // Assuming points array exists
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Lesson Points List
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: controller.lessonData['points']?.length ?? 0,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item =
                      controller
                          .lessonData['points'][index]; // Assuming points exist in 'points' field
                  return GestureDetector(
                    onTap:
                        () => Get.toNamed(
                          '/materi-detail',
                          arguments: {
                            'point':
                                item, // Pass the individual point data here
                          },
                        ),
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
                            '0${index + 1}. ${item['title']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          LinearProgressIndicator(
                            value: 1, // Example: Set to 50% progress
                            minHeight: 8,
                            backgroundColor: Colors.grey[300],
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFF7CE48A),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "100%", // Example progress
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
