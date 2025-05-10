import 'package:get/get.dart';
import 'package:quiz_analytic/Controllers/auth_controller.dart';
import 'Views/Guest/login_page.dart';
import 'Views/Guest/register_page.dart';
import 'Views/Guest/splash_page.dart';
import 'Views/Latihan/create_latihan.dart';
import 'Views/Latihan/latihan.dart';
import 'Views/Latihan/latihan_detail.dart';
import 'Views/Latihan/latihan_evaluasi.dart';
import 'Views/Materi/materi.dart';
import 'Views/Materi/materi_detail.dart';
import 'Views/Materi/materi_detail_list.dart';
import 'Views/Quiz/quiz_page.dart';
import 'Views/Quiz/quiz_result_page.dart';
import 'Views/home_page.dart';

final appRoutes = [
  // SplashPage route (no controller needed)
  GetPage(name: '/', page: () => SplashPage()),

  // LoginPage with lazy-loaded AuthController
  GetPage(name: '/login', page: () => LoginPage()),

  // RegisterPage route with lazy-loaded AuthController
  GetPage(name: '/register', page: () => RegisterPage()),

  // HomePage with lazy-loaded HomeController or AuthController if needed
  GetPage(name: '/home', page: () => HomePage()),

  // MateriPage
  GetPage(name: '/materi', page: () => MateriPage()),

  // MateriDetailList route
  GetPage(name: '/materi-detail-list', page: () => MateriDetailList()),

  // MateriDetailPage route
  GetPage(name: '/materi-detail', page: () => MateriDetailPage()),

  // QuizPage
  GetPage(name: '/quiz', page: () => QuizPage()),

  // QuizResultPage
  GetPage(name: '/quiz-result', page: () => QuizResultPage()),

  // LatihanPage
  GetPage(name: '/latihan', page: () => LatihanPage()),

  // LatihanDetail route
  GetPage(name: '/latihan-detail', page: () => LatihanDetail()),

  // LatihanEvaluasi route
  GetPage(name: '/latihan-evaluasi', page: () => LatihanEvaluasi()),

  // CreateLatihanPage route
  GetPage(name: '/create-latihan', page: () => CreateLatihanPage()),
];
