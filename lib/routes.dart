import 'package:get/get.dart';
import 'Middlewares/auth_middleware.dart';
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
  GetPage(name: '/', page: () => SplashPage()),

  // Halaman bebas akses
  GetPage(name: '/login', page: () => LoginPage(), middlewares: [AuthMiddleware()]),
  GetPage(name: '/register', page: () => RegisterPage(), middlewares: [AuthMiddleware()]),

  // Halaman yang memerlukan login
  GetPage(name: '/home', page: () => HomePage(), middlewares: [AuthMiddleware()]),
  GetPage(name: '/materi', page: () => MateriPage(), middlewares: [AuthMiddleware()]),
  GetPage(name: '/materi-detail-list', page: () => MateriDetailList(), middlewares: [AuthMiddleware()]),
  GetPage(name: '/materi-detail', page: () => MateriDetailPage(), middlewares: [AuthMiddleware()]),
  GetPage(name: '/quiz', page: () => QuizPage(), middlewares: [AuthMiddleware()]),
  GetPage(name: '/quiz-result', page: () => QuizResultPage(), middlewares: [AuthMiddleware()]),
  GetPage(name: '/latihan', page: () => LatihanPage(), middlewares: [AuthMiddleware()]),
  GetPage(name: '/latihan-detail', page: () => LatihanDetail(), middlewares: [AuthMiddleware()]),
  GetPage(name: '/latihan-evaluasi', page: () => LatihanEvaluasi(), middlewares: [AuthMiddleware()]),
  GetPage(name: '/create-latihan', page: () => CreateLatihanPage(), middlewares: [AuthMiddleware()]),
];
