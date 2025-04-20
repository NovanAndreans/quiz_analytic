import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Components/Widgets/Forms/custom_button.dart';
import '../../Components/Widgets/Forms/custom_textfield.dart';
import '../../Components/Widgets/Settings/logo.dart';
import '../../Controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                'Login',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 24),
              CustomTextField(
                controller: authController.usernameController,
                hintText: 'Email',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: authController.passwordController,
                hintText: 'Password',
                icon: Icons.lock_outline,
                obscureText: true,
              ),
              const SizedBox(height: 24),
              Obx(
                () => CustomButton(
                  text:
                      authController.isLoading.value ? 'Loading...' : 'Sign In',
                  onPressed:
                      authController.isLoading.value
                          ? null
                          : authController.login,
                ),
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/register');
                },
                child: const Text.rich(
                  TextSpan(
                    text: 'Belum Punya Akun? ',
                    children: [
                      TextSpan(
                        text: 'Daftar Disini',
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
    );
  }
}
