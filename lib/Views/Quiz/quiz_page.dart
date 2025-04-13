import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/quiz_controller.dart';

class QuizPage extends StatelessWidget {
  final QuizController controller = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kuis")),
      body: Obx(() {
        final question = controller.questions[controller.currentQuestionIndex.value];

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Soal ${controller.currentQuestionIndex.value + 1}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text(question["question"]),
              SizedBox(height: 16),

              for (int i = 0; i < question["options"].length; i++)
                ListTile(
                  title: Text(question["options"][i]),
                  leading: Radio<int>(
                    value: i,
                    groupValue: controller.selectedAnswer.value,
                    onChanged: controller.isAnswered.value
                        ? null
                        : (val) => controller.selectAnswer(val!),
                  ),
                ),

              SizedBox(height: 16),

              if (!controller.isAnswered.value)
                ElevatedButton(
                  onPressed: controller.selectedAnswer.value != -1
                      ? controller.submitAnswer
                      : null,
                  child: Text("Kunci Jawaban"),
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(),
                    Text("Kesulitan: ${question["difficulty"]}"),
                    Text("Benar: ${controller.correctAnswers}"),
                    Text("Salah: ${controller.wrongAnswers}"),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: controller.nextQuestion,
                      child: Text("Next"),
                    ),
                  ],
                ),
            ],
          ),
        );
      }),
    );
  }
}
