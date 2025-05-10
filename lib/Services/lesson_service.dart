import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart'; // Import get_storage
import '../env.dart'; // Assuming baseUrl is defined in this file

class LessonService extends GetConnect {
  final box = GetStorage();  // Initialize GetStorage

  LessonService() {
    // Ensure baseUrl is correctly initialized with the protocol (http:// or https://)
    httpClient.baseUrl = baseUrl; // Ensure baseUrl includes host and path, e.g., 'http://your-api-url.com/api'
    httpClient.followRedirects = false; // Optional: prevent automatic redirects
  }

  // Fetch Lesson (Lesson) data
  Future<Response> fetchLesson() async {
    try {
      // Retrieve the Bearer token from GetStorage
      String? token = box.read('token'); // Make sure the token is saved under the key 'token'

      // Add Bearer token to the headers if available
      var headers = {
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token', // Include Bearer token if it exists
      };

      // Make the request with the correct endpoint and headers
      var response = await get(
        '/lesson', // Ensure this is the correct endpoint relative to baseUrl
        headers: headers, // Attach the headers with Bearer token
      );

      // Check the response status code
      if (response.isOk) {
        print("Lesson fetched successfully: ${response.body}");
        return response;
      } else {
        print("Failed to fetch Lesson: ${response.statusText}");
        return Response(statusCode: 500, statusText: 'Failed to fetch Lesson');
      }
    } catch (e) {
      // Handle errors if any
      print("Error during fetch Lesson: $e");
      return Response(statusCode: 500, statusText: 'Internal Server Error');
    }
  }

  Future<Response> fetchLessonDetail(int lessonId) async {
    try {
      // Retrieve the Bearer token from GetStorage
      String? token = box.read('token'); // Make sure the token is saved under the key 'token'

      // Add Bearer token to the headers if available
      var headers = {
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token', // Include Bearer token if it exists
      };

      // Make the request with the correct endpoint and headers
      var response = await get(
        '/lesson/$lessonId', // Fetch lesson data by its ID
        headers: headers, // Attach the headers with Bearer token
      );

      // Check the response status code
      if (response.isOk) {
        print("Lesson fetched successfully: ${response.body}");
        return response;
      } else {
        print("Failed to fetch Lesson: ${response.statusText}");
        return Response(statusCode: 500, statusText: 'Failed to fetch Lesson');
      }
    } catch (e) {
      // Handle errors if any
      print("Error during fetch Lesson: $e");
      return Response(statusCode: 500, statusText: 'Internal Server Error');
    }
  }
}
