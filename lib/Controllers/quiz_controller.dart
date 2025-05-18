import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/quiz.dart';
import '../Services/quiz_service.dart';

class QuizController extends GetxController {
  final RxInt currentQuestionIndex = 0.obs;
  final RxInt correctAnswers = 0.obs;
  final RxInt wrongAnswers = 0.obs;
  final RxInt selectedAnswer = (-1).obs;
  final RxBool isAnswered = false.obs;
  final RxBool isLoading = false.obs;
  final RxInt remainingTime = 10.obs;  // Remaining time in seconds
  final Rx<Color> timerColor = Colors.green.obs; // Timer color based on remaining time
  var questions = <Question>[].obs;
  final quizService = QuizService();
  var quizzesList = <Quiz>[].obs;
  var currentQuiz = Rx<Quiz?>(null);
  late Timer timer;

  @override
  void onInit() {
    super.onInit();
    fetchQuizzes();
  }

  // Start the countdown timer
  void startTimer() {
    remainingTime.value = 10; // Reset timer to 10 seconds
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
        _updateTimerColor(); // Update the color based on remaining time
      } else {
        timer.cancel(); // Stop the timer when it reaches 0
      }
    });
  }

  // Update the timer color based on the remaining time
  void _updateTimerColor() {
    if (remainingTime.value >= 7) {
      timerColor.value = Colors.green;
    } else if (remainingTime.value >= 4) {
      timerColor.value = Colors.yellow;
    } else {
      timerColor.value = Colors.red;
    }
  }

  // Fetch quizzes when the controller is initialized
  void fetchQuizzes() async {
    isLoading.value = true;
    try {
      var response = await quizService.fetchQuizzes();
      isLoading.value = false;
      if (response.isOk) {
        var quizData = response.body['content'];
        if (quizData != null && quizData.isNotEmpty) {
          var quizzes = quizData.map<Quiz>((quizJson) {
            return Quiz(
              id: quizJson['id'],
              title: quizJson['title'],
              description: quizJson['description'],
              lessonPoint: LessonPoint.fromJson(quizJson['lesson_point']),
              questions: [],
              cover: Cover.fromJson(quizJson['cover']),
            );
          }).toList();
          quizzesList.assignAll(quizzes);
        } else {
          print("No quizzes available");
        }
      }
    } catch (e) {
      isLoading.value = false;
      print("Error while fetching quizzes: $e");
    }
  }

  // Fetch quiz details
  void fetchQuizDetail(int quizId) async {
    isLoading.value = true;
    try {
      var response = await quizService.fetchQuizDetail(quizId);
      isLoading.value = false;
      if (response.isOk) {
        var quizData = response.body['content'];
        var quiz = Quiz(
          id: quizData['id'],
          title: quizData['title'],
          description: quizData['description'],
          lessonPoint: LessonPoint.fromJson(quizData['lesson_point']),
          questions: List<Question>.from(
            quizData['questions'].map((questionJson) => Question.fromJson(questionJson)),
          ),
          cover: Cover.fromJson(quizData['cover']),
        );
        currentQuiz.value = quiz;
        questions.assignAll(quiz.questions);
        startTimer(); // Start the timer when quiz is loaded
      }
    } catch (e) {
      isLoading.value = false;
      print("Error while fetching quiz details: $e");
    }
  }

  // Select the answer for the current question
  void pilihJawaban(int index) {
    selectedAnswer.value = index;
    isAnswered.value = false;
  }

  // Submit the answer for the current question
  void submitAnswer() {
    if (selectedAnswer.value == -1) {
      print("Please select an answer!");
      return;
    }
    if (questions[currentQuestionIndex.value]
        .options[selectedAnswer.value]
        .isCorrect) {
      correctAnswers.value++;
    } else {
      wrongAnswers.value++;
    }
    isAnswered.value = true;
  }

  // Move to the next question
  void nextQuestion() {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
      selectedAnswer.value = -1;
      isAnswered.value = false;
    } else {
      submitAnswers(); // Submit answers when on the last question
    }
  }

  // Submit all answers
  Future<void> submitAnswers() async {
    List<Map<String, dynamic>> answers = [];

    for (var i = 0; i < questions.length; i++) {
      var selectedOption = questions[i].options[selectedAnswer.value];
      if (selectedOption != null) {
        answers.add({
          'question_id': questions[i].id,
          'question_option_id': selectedOption.id,
        });
      }
    }

    if (answers.isNotEmpty) {
      var payload = {'answers': answers};

      try {
        isLoading.value = true;
        var response = await quizService.submitQuizAnswers(payload, currentQuiz.value?.id ?? 0);

        if (response.isOk) {
          print("Answers submitted successfully");
          Get.toNamed('/quiz-result'); // Navigate to result page
        } else {
          print("Failed to submit answers: ${response.statusText}");
        }
      } catch (e) {
        print("Error submitting answers: $e");
      } finally {
        isLoading.value = false;
      }
    } else {
      print("No answers selected");
    }
  }

  // Reset the quiz to the initial state
  void resetQuiz() {
    currentQuestionIndex.value = 0;
    correctAnswers.value = 0;
    wrongAnswers.value = 0;
    selectedAnswer.value = -1;
    isAnswered.value = false;
    questions.clear();
    remainingTime.value = 10; // Reset time to 10 seconds
  }
}
