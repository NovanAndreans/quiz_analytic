import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Components/Widgets/Settings/logo.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Logo(size: LogoSize.L),
                  SizedBox(height: 16),
                  Text(
                    "AIQuiz",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Analisis & Validasi Soal Ujian Otomatis",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Tombol Skip di kanan atas
            Positioned(
              top: 10,
              right: 20,
              child: GestureDetector(
                onTap: () => Get.offNamed('/login'),
                child: Text(
                  "Skip",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 21, // ⬅️ ukuran lebih besar
                    fontWeight: FontWeight.bold, // ⬅️ bold
                  ),
                ),
              ),
            ),

            // Tombol Get Started di bawah
            Positioned(
              bottom: 30,
              left: 32,
              right: 32,
              child: ElevatedButton(
                onPressed: () => Get.toNamed('/login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF68A5FF), // biru pastel
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  "Get Started",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
