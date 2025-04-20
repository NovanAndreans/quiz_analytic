import 'package:get/get.dart';
import '../env.dart';

class LessonService extends GetConnect {
  Future<Response> getLessons() async {
    return get('$baseUrl/lesson');
  }
}
