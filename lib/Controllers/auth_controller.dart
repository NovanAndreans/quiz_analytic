import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Components/Widgets/Settings/custom_snackbar.dart';
import '../Services/auth_services.dart';

class AuthController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final AuthService authService = Get.put(AuthService());
  final box = GetStorage(); // ⬅️ penyimpanan lokal

  var isLoading = false.obs;

  void login() async {
    isLoading.value = true;

    final response = await authService.login(
      usernameController.text.trim(),
      passwordController.text.trim(),
    );

    isLoading.value = false;

    if (response.statusCode == 200 && response.body != null) {
      final token = response.body['token'];
      final user = response.body['user'];

      // Simpan token & user ke GetStorage
      box.write('token', token);
      box.write('user', user);

      Get.offAllNamed('/home');
      CustomSnackbar.success('Success', 'Login berhasil');
    } else {
      CustomSnackbar.error('Error', 'Login gagal');
    }
  }

  Map<String, dynamic>? get currentUser => box.read('user');
  String? get token => box.read('token');

  void logout() {
    box.erase(); // atau box.remove('token');
    Get.offAllNamed('/login');
  }

  bool get isLoggedIn => box.hasData('token');
}
