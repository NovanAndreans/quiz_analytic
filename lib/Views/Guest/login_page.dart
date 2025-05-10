import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Components/Widgets/Forms/custom_button.dart';
import '../../Components/Widgets/Forms/custom_textfield.dart';
import '../../Components/Widgets/Settings/logo.dart';
import '../../Controllers/auth_controller.dart';  // Import your AuthController

class LoginPage extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());  // Bind AuthController to the widget

  @override
  Widget build(BuildContext context) {
    // Check if user is already logged in
    if (_authController.isLoggedIn) {
      // If logged in, navigate directly to the HomePage
      Future.delayed(Duration.zero, () {
        Get.offAllNamed('/home');
      });
    }

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
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 24),
              // Bind the email field to the controller
              CustomTextField(
                controller: _authController.emailController,
                hintText: 'Email',
                icon: Icons.email_outlined,
                // keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              // Bind the password field to the controller
              CustomTextField(
                controller: _authController.passwordController,
                hintText: 'Password',
                icon: Icons.lock_outline,
                obscureText: true,
              ),
              const SizedBox(height: 24),
              // Trigger the login function on button press
              CustomButton(
                text: 'Sign In',
                onPressed: () {
                  _authController.login();  // Call login method from controller
                },
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
