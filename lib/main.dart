import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes.dart';

void main() {
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
