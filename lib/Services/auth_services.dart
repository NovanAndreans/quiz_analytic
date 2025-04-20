import 'package:get/get.dart';
import '../env.dart';

class AuthService extends GetConnect {
  AuthService() {
    httpClient.baseUrl = baseUrl; // ganti dengan endpoint API asli
    httpClient.followRedirects = false; // opsional, cegah redirect otomatis
  }

  Future<Response> login(String email, String password) async {
    final body = {'email': email, 'password': password};
    var response = await post(
      '/login',
      body,
      headers: {'Accept': 'application/json'},
    );
    print(response.body);
    return response; // karena baseUrl sudah diset
  }
}
