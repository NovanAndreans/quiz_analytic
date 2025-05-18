import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/quiz_controller.dart';

class QuizResultPage extends StatelessWidget {
  final QuizController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final total =
        controller.correctAnswers.value + controller.wrongAnswers.value;
    final score = (controller.correctAnswers.value / total * 100)
        .toStringAsFixed(0);

    return Scaffold(
      appBar: AppBar(title: Text("Hasil Kuis")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Selamat Anda telah selesai",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.resetQuiz();
                  Get.offAllNamed('/home');
                },
                child: Text("Kembali ke Home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
