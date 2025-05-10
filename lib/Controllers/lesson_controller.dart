import 'package:get/get.dart';
import 'package:quiz_analytic/Models/lesson.dart';
import 'package:quiz_analytic/Services/lesson_service.dart';

class LessonController extends GetxController {
  var isLoading = true.obs;
  var LessonList = <Lesson>[].obs;
  final LessonService _LessonService = LessonService();

  // Fetch Lesson data using the LessonService
  Future<void> fetchLesson() async {
    try {
      isLoading(true); // Start loading state
      var response = await _LessonService.fetchLesson();

      if (response.isOk) {
        // Map the response body to Lesson objects
        var data = List<Lesson>.from(
            response.body['content'].map((item) => Lesson.fromJson(item)));
        LessonList.assignAll(data); // Update the Lesson list
      } else {
        // Handle error
        Get.snackbar('Error', 'Failed to fetch Lesson');
      }
    } finally {
      isLoading(false); // Stop loading state
    }
  }
}
