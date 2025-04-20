import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'routes.dart';

void main() async {
  await GetStorage.init();
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
