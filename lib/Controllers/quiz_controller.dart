import 'package:get/get.dart';

class QuizController extends GetxController {
  final RxInt currentQuestionIndex = 0.obs;
  final RxInt correctAnswers = 0.obs;
  final RxInt wrongAnswers = 0.obs;
  final RxInt selectedAnswer = (-1).obs;
  final RxBool isAnswered = false.obs;

  final List<Map<String, dynamic>> questions = [
    {
      "question": "Manakah pernyataan yang benar mengenai perbedaan antara basis data dan file system?",
      "options": [
        "Basis data memiliki tingkat redundansi yang lebih tinggi dibandingkan file system.",
        "File system lebih unggul dalam menjaga integritas data dibandingkan basis data.",
        "Basis data memiliki struktur yang lebih terorganisir dibandingkan file system.",
        "File system memungkinkan pengaturan hak akses lebih baik dibandingkan basis data.",
      ],
      "answer": 2,
      "difficulty": "Sedang"
    },
    {
      "question": "Apa fungsi utama dari DBMS?",
      "options": [
        "Menyimpan data dalam bentuk teks.",
        "Mengelola dan mengakses data dengan efisien.",
        "Menghapus seluruh isi database secara otomatis.",
        "Mengkonversi data ke dalam format gambar.",
      ],
      "answer": 1,
      "difficulty": "Mudah"
    },
    {
      "question": "Apa itu SQL?",
      "options": [
        "Sistem keamanan jaringan",
        "Bahasa pemrograman untuk web",
        "Bahasa untuk mengelola dan memanipulasi data di database",
        "Program grafik dan desain",
      ],
      "answer": 2,
      "difficulty": "Mudah"
    },
  ];

  void selectAnswer(int index) {
    selectedAnswer.value = index;
  }

  void submitAnswer() {
    if (selectedAnswer.value == questions[currentQuestionIndex.value]["answer"]) {
      correctAnswers.value++;
    } else {
      wrongAnswers.value++;
    }
    isAnswered.value = true;
  }

  void nextQuestion() {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
      selectedAnswer.value = -1;
      isAnswered.value = false;
    } else {
      Get.toNamed('/quiz-result');
    }
  }

  void resetQuiz() {
    currentQuestionIndex.value = 0;
    correctAnswers.value = 0;
    wrongAnswers.value = 0;
    selectedAnswer.value = -1;
    isAnswered.value = false;
  }
}
