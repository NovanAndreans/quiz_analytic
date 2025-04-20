import 'package:get/get.dart';
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
  GetPage(name: '/login', page: () => LoginPage()),
  GetPage(name: '/register', page: () => RegisterPage()),
  GetPage(name: '/home', page: () => HomePage()),
  GetPage(name: '/materi', page: () => MateriPage()),
  GetPage(name: '/materi-detail-list', page: () => MateriDetailList()),
  GetPage(name: '/materi-detail', page: () => MateriDetailPage()),
  GetPage(name: '/quiz', page: () => QuizPage()),
  GetPage(name: '/quiz-result', page: () => QuizResultPage()),
  GetPage(name: '/latihan', page: () => LatihanPage()),
  GetPage(name: '/latihan-detail', page: () => LatihanDetail()),
  GetPage(name: '/latihan-evaluasi', page: () => LatihanEvaluasi()),
  GetPage(name: '/create-latihan', page: () => CreateLatihanPage()),
];
