import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../Components/Widgets/Settings/custom_snackbar.dart';
import '../Services/auth_services.dart';

class AuthController extends GetxController {
  // TextControllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController(); // For registration
  final confirmPasswordController = TextEditingController(); // For registration

  // AuthService and GetStorage instances
  final AuthService authService = Get.put(AuthService());
  final box = GetStorage();

  // Reactive loading state
  var isLoading = false.obs;

  // Getter to check if user is logged in based on token
  bool get isLoggedIn => box.hasData('token');

  // Login method
  void login() async {
    isLoading.value = true;

    // Make login API request using email and password
    final response = await authService.login(
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    isLoading.value = false;

    if (response.statusCode == 200 && response.body != null) {
      final token = response.body['token'];
      final user = response.body['user'];

      // Save token and user info to local storage
      box.write('token', token);
      box.write('user', user);

      // Navigate to home page
      Get.offAllNamed('/home');
      CustomSnackbar.success('Success', 'Login berhasil');
    } else {
      CustomSnackbar.error('Error', 'Login gagal');
      print(response.body);
    }
  }

  // Register method
  void register() async {
  // Validasi jika kolom name, email, dan password kosong
  if (nameController.text.trim().isEmpty ||
      emailController.text.trim().isEmpty ||
      passwordController.text.trim().isEmpty) {
    CustomSnackbar.error('Error', 'Semua kolom harus diisi');
    return;
  }

  if (passwordController.text.trim() != confirmPasswordController.text.trim()) {
    CustomSnackbar.error('Error', 'Password tidak cocok');
    return;
  }

  isLoading.value = true;

  // Kirim data ke server menggunakan AuthService
  final response = await authService.register(
    nameController.text.trim(),
    emailController.text.trim(),
    passwordController.text.trim(),
  );

  isLoading.value = false;

  if (response.isOk && response.body != null) {
    final token = response.body['token'];
    final user = response.body['user'];

    // Simpan data token dan user ke storage lokal
    box.write('token', token);
    box.write('user', user);

    // Navigasi ke halaman utama
    Get.offAllNamed('/login');
    CustomSnackbar.success('Success', 'Registrasi berhasil');
  } else {
    // Menangani kegagalan registrasi
    CustomSnackbar.error('Error', 'Registrasi gagal');
    print(response.body);
  }
}

  // Logout method
  void logout() {
    // Clear token and user data from local storage
    box.erase();

    // Navigate to login page
    Get.offAllNamed('/login');
  }

  // Getters for token and user data from local storage
  Map<String, dynamic>? get currentUser => box.read('user');
  String? get token => box.read('token');
}
