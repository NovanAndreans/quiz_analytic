import 'package:get/get.dart';
import 'dart:convert'; // Add this line at the top of your file
import '../env.dart';

class AuthService extends GetConnect {
  AuthService() {
    httpClient.baseUrl = baseUrl; // Ensure baseUrl is set correctly
    httpClient.followRedirects = false; // Optional: prevent automatic redirects
  }

  // Login method
  Future<Response> login(String email, String password) async {
    final body = {'email': email, 'password': password};

    try {
      var response = await post(
        '/login', // Ensure the 'login' endpoint is correctly appended to the baseUrl
        body,
        headers: {
          'Accept': 'application/json',
          'Content-Type':
              'application/json', // Add content type if required by your backend
        },
      );

      // Check the status code to determine success/failure
      if (response.isOk) {
        print("Login successful: ${response.body}");
      } else {
        print("Login failed: ${response.statusText}");
      }

      return response;
    } catch (e) {
      // Handle any exception that occurs during the request
      print("Error during login: $e");
      return Response(statusCode: 500, statusText: 'Internal Server Error');
    }
  }

  // Register method
  Future<Response> register(String name, String email, String password) async {
    final body = {'name': name, 'email': email, 'password': password};

    try {
      var response = await post(
        '/register', // Endpoint yang sesuai
        body,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );

      // Handle response
      if (response.isOk) {
        print("Registration successful: ${response.body}");
      } else {
        print("Registration failed: ${response.statusText}");
      }

      return response;
    } catch (e) {
      print("Error during registration: $e");
      return Response(statusCode: 500, statusText: 'Internal Server Error');
    }
  }
}
