import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Components/Widgets/Forms/custom_button.dart';
import '../../Components/Widgets/Forms/custom_textfield.dart';
import '../../Components/Widgets/Settings/logo.dart';
import '../../Controllers/auth_controller.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ambil AuthController
    final AuthController authController = Get.find<AuthController>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                Logo(size: LogoSize.M),
                const SizedBox(height: 12),
                const Text(
                  'AIQuiz',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Analisis & Validasi Soal Ujian Otomatis',
                  style: TextStyle(fontSize: 10),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Register',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  controller: authController.nameController,
                  hintText: 'Name',
                  icon: Icons.person_outline,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: authController.emailController,
                  hintText: 'Email',
                  icon: Icons.email_outlined,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: authController.passwordController,
                  hintText: 'Password',
                  icon: Icons.lock_outline,
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: authController.confirmPasswordController,
                  hintText: 'Konfirmasi Password',
                  icon: Icons.lock_outline,
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                CustomButton(
                  text: 'Sign Up',
                  onPressed: () {
                    // Validasi apakah password dan konfirmasi password cocok
                    if (authController.passwordController.text.trim() != authController.confirmPasswordController.text.trim()) {
                      Get.snackbar(
                        'Error',
                        'Password tidak cocok',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                      return;
                    }

                    // Panggil register melalui AuthController
                    authController.register();
                  },
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    Get.back(); // Balik ke halaman login
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: 'Sudah Punya Akun? ',
                      children: [
                        TextSpan(
                          text: 'Login Disini',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
