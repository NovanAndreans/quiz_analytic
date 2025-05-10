import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quiz_analytic/Controllers/auth_controller.dart';
import 'routes.dart';

void main() async {
  await GetStorage.init();
  Get.put(AuthController());
  runApp(AIQuizApp());
}

class AIQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AIQuiz',
      initialRoute: '/',
      getPages: appRoutes,
    );
  }
}
