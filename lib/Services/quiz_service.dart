import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../env.dart'; // Assuming baseUrl is defined in this file

class QuizService extends GetConnect {
  final box = GetStorage(); // Initialize GetStorage

  QuizService() {
    // Ensure baseUrl is correctly initialized with the protocol (http:// or https://)
    httpClient.baseUrl =
        baseUrl; // Ensure baseUrl includes host and path, e.g., 'http://your-api-url.com/api'
    httpClient.followRedirects = false; // Optional: prevent automatic redirects
  }

  // Fetch Quiz data
  Future<Response> fetchQuizzes() async {
    try {
      String? token = box.read(
        'token',
      ); // Retrieve the Bearer token from GetStorage

      var headers = {
        'Accept': 'application/json',
        if (token != null)
          'Authorization': 'Bearer $token', // Include Bearer token if available
      };

      var response = await get(
        '/quiz',
        headers: headers,
      ); // Ensure this is the correct endpoint

      if (response.isOk) {
        print("Quizzes fetched successfully: ${response.body}");
        return response;
      } else {
        print("Failed to fetch quizzes: ${response.statusText}");
        return Response(statusCode: 500, statusText: 'Failed to fetch quizzes');
      }
    } catch (e) {
      print("Error during fetch quizzes: $e");
      return Response(statusCode: 500, statusText: 'Internal Server Error');
    }
  }

  // Fetch details of a specific Quiz
  Future<Response> fetchQuizDetail(int quizId) async {
    try {
      String? token = box.read(
        'token',
      ); // Retrieve the Bearer token from GetStorage

      var headers = {
        'Accept': 'application/json',
        if (token != null)
          'Authorization': 'Bearer $token', // Include Bearer token if available
      };

      var response = await get(
        '/quiz/$quizId',
        headers: headers,
      ); // Fetch quiz data by its ID

      if (response.isOk) {
        print("Quiz details fetched successfully: ${response.body}");
        return response;
      } else {
        print("Failed to fetch quiz details: ${response.statusText}");
        return Response(
          statusCode: 500,
          statusText: 'Failed to fetch quiz details',
        );
      }
    } catch (e) {
      print("Error during fetch quiz details: $e");
      return Response(statusCode: 500, statusText: 'Internal Server Error');
    }
  }

  // Dynamic submission of quiz answers
  Future<Response> submitQuizAnswers(
    Map<String, dynamic> answersData,
    int quizId,
  ) async {
    try {
      var response = await post(
        '/quiz/$quizId/submit', // Dynamic quiz ID in the URL
        answersData, // Submit the dynamically created answers
        headers: {
          'Authorization': 'Bearer ${box.read('token')}', // Bearer token
          'Accept': 'application/json', // Accept header
        },
      );

      // Return the response from the API
      if (response.isOk) {
        print("Answers submitted successfully: ${response.body}");
      } else {
        print("Failed to submit answers: ${response.statusText}");
      }

      return response;
    } catch (e) {
      print("Error during answer submission: $e");
      return Response(statusCode: 500, statusText: 'Internal Server Error');
    }
  }
}
