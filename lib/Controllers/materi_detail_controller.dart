import 'package:get/get.dart';
import 'package:quiz_analytic/Services/lesson_service.dart';

class MateriDetailController extends GetxController {
  var lessonData = {}.obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  // Service instance
  final LessonService lessonService;

  MateriDetailController({required this.lessonService});

  // Fetch lesson data using service
  Future<void> fetchLessonData(int lessonId) async {
    try {
      isLoading(true); // Start loading
      final response = await lessonService.fetchLessonDetail(lessonId);

      // Check if the response is successful
      if (response.isOk) {
        lessonData.value = response.body['content']; // Update the lesson data
      } else {
        errorMessage.value = "Failed to fetch lesson data: ${response.statusText}";
      }
    } catch (e) {
      errorMessage.value = "An error occurred: $e";
    } finally {
      isLoading(false); // End loading
    }
  }
}
