import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/quiz_controller.dart'; // Use QuizController

class LatihanDetail extends StatelessWidget {
  LatihanDetail({super.key});

  final QuizController controller = Get.put(
    QuizController(),
  ); // Use the existing QuizController

  @override
  Widget build(BuildContext context) {
    final quizId = Get.arguments as int?;

    if (quizId == null) {
      return const Center(child: Text("Quiz not found"));
    }

    controller.fetchQuizDetail(quizId);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.questions.isEmpty) {
          return const Center(child: Text("No questions available"));
        }

        return Column(
          children: [
            // App Bar
            Container(
              padding: const EdgeInsets.only(
                top: 48,
                left: 16,
                right: 16,
                bottom: 12,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF3A73DF),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Soal",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "00${controller.currentQuestionIndex.value + 1}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      controller
                          .questions[controller.currentQuestionIndex.value]
                          .question,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 12),

                    // Timer with dynamic color
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "${controller.remainingTime.value} Detik",
                          style: TextStyle(color: controller.timerColor.value),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: LinearProgressIndicator(
                            value: controller.remainingTime.value / 10,
                            backgroundColor: Colors.grey,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              controller.timerColor.value,
                            ),
                            minHeight: 4,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Pilihan jawaban
                    Obx(() {
                      return Column(
                        children: List.generate(
                          controller
                              .questions[controller.currentQuestionIndex.value]
                              .options
                              .length,
                          (index) {
                            final isSelected =
                                controller.selectedAnswer.value == index;
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
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                child: Text(
                                  controller
                                      .questions[controller
                                          .currentQuestionIndex
                                          .value]
                                      .options[index]
                                      .option,
                                  style: TextStyle(
                                    color:
                                        isSelected
                                            ? Colors.white
                                            : Colors.black87,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }),

                    const Spacer(),

                    // Next Button
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          if (controller.selectedAnswer.value != -1) {
                            controller.nextQuestion();
                          } else {
                            Get.snackbar("Error", "Please select an answer");
                          }
                        },
                        child: const Text(
                          "Next",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
