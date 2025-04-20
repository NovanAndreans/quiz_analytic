import 'package:get/get.dart';
import '../Models/lesson.dart';
import '../Services/lesson_service.dart';

class LessonController extends GetxController {
  final lessons = <Lesson>[].obs;
  final isLoading = true.obs;

  final LessonService _service = Get.put(LessonService());

  @override
  void onInit() {
    fetchLessons();
    super.onInit();
  }

  void fetchLessons() async {
    isLoading.value = true;
    print('tes');

    final response = await _service.getLessons();
    if (response.statusCode == 200 && response.body['content'] != null) {
      final list = response.body['content'] as List;
      lessons.value = list.map((json) => Lesson.fromJson(json)).toList();
    } else {
      print('Gagal fetch: ${response.body}');
    }

    isLoading.value = false;
  }
}
